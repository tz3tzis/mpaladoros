
require 'open-uri'
require 'benchmark'


def get(users)
	threads = []
	time = Benchmark.measure{
		1.upto(users) do
			threads << Thread.new do 
				response = open('https://mpaladoros-app.herokuapp.com/').read
			end
		end
		threads.map(&:join)
	}
	return time
end

puts get(10)
