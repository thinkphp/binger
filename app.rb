require 'binger'

bing = Bing.new("49EB4B94127F7C7836C96DEB3F2CD8A6D12BDB71")

results = bing.search(q="MooTools",sources="web")

f = File.open("output.txt",'w')    

f.puts results['SearchResponse']["Web"]["Results"]

puts results
