# Binger

A simple gem that provides a client to Microsoft's Bing Search API v2 using HTTP GET.

# Installation

```
$ git clone git://github.com/thinkphp/binger.git
$ cd binger
$ gem build binger.gemspec
$ gem install ./bing-0.1.0.gem
$ irb
$ irb(main):001:0> require 'binger'
$ => true
$ irb(main):002:0> Bing.new('your-api-key')
$ => #<Bing:0xffb4ae0 @api_key="your-api-key">
$ irb(main):003:0> exit
```

# Example

```
require 'bing'

bing = Bing.new("49EB4B94127F7C7836C96DEB3F2CD8A6D12BDB71")

results = bing.search(q="MooTools",sources="web")

f = File.open("output.txt",'w')    

f.puts results['SearchResponse']["Web"]["Results"]

puts results
```
