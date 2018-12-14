module GamesHelper

	require 'open-uri'
	require 'benchmark'

	POOL_SIZE = 100

	def get_test(count)

		time = Benchmark.measure{
			jobs = Queue.new
			count.times{|i| jobs.push i}
			workers = (POOL_SIZE).times.map do
			  Thread.new do
			    begin      
			      while x = jobs.pop(true)
			        response = open('https://mpaladoros-app.herokuapp.com/users/auth/facebook').read
			      end
			    rescue ThreadError
			    end
			  end
			end
			workers.map(&:join)
		}
		return time,count
	end
end


