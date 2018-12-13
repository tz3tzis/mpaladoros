
require 'open-uri'
require 'benchmark'

def get(users)
	time = Benchmark.realtime{
		1.upto(users) do |i|
			response = open('https://mpaladoros-app.herokuapp.com/games').read
		end
	}

	return time
end

puts get(10)