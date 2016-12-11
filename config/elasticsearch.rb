require 'elasticsearch/transport'

puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"

client = Elasticsearch::Client.new 'http://0.0.0.0:9200'
response = client.perform_request 'GET', '_cluster/health'