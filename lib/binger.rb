require 'net/http'
require 'json'
require 'uri'

    #API DOC http://www.bing.com/developers/s/APIBasics.html#_Using_the_API

 class Bing

    attr_accessor :api_key 

    #format = json || xml => http://api.bing.net/xml.aspx
    ENDPOINT = "http://api.bing.net/json.aspx" 

    # Create a new instance of Bing with your Bing api key
    #  
    # Example:         
    # 
    # >> require 'binger' 
    # => true
    # >> bing = Bing.new('your-api-key')
    # => #<Bing:0x1af10 @api_key="your-api-key">  
    #
    # Arguments:
    # 
    # @param (String) api_key - you specify a key (Application ID) and such key will be used to authenticate the request.
    def initialize(api_key)
        @api_key = api_key 
    end

    # Sending a request HTTP GET to the Endpoint.
    # 
    # A request to the HTTP endpoint consists of a HTTP GET request to the approriate URI. There are two URLs, one for XML results and one for JSON results.
    # These are http://api.bing.com/xml.aspx and and http://api.bing.com/json.aspx, respectively.
    # 
    # Example:
    #
    # >> bing.search(query="MooTools",sources="web") 
    # => Anatomy of a result set
    # => The results returned for a request differ from SourceType to SourceType, but in every case they include a header and a results body
    # => The document element is always SearchResponse, with a Query child element that contains the query used to produce the results. 
    # => {"SearchResponse"=>{"Version"=>"2.2", "Query"=>{"SearchTerms"=>"MooTools"}, "Web"=>{"Total"=>85100, "Offset"=>0, "Results"=>[{}.{}...]}

    # Arguments:
    # @param (String) q        - The query parameter is the textof the query you want the API to execute. example: query=mootools
    # @param (String) sources  - The sources parameter is one or more values indicating the SourceType or SourceTypes from which you want to request results.
    #                            The "web" Source type returns a set of results from the WEB SourceType, "Image" searches for images on the WEB, "News" searches news stories
    # @param (Hash)   optional - page/offset
    def search(q="",sources="",optional=nil)
 
        params = {"query"=>q, "sources"=>sources} 
        params.merge!(optional) if optional
        params = URI.encode_www_form( params )
        url = URI("#{ENDPOINT}?Appid=#{api_key}&#{params}")

        return JSON.parse(Net::HTTP.get(url))
 
    end
 end