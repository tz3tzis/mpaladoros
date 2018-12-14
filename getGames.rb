require 'open-uri'
require 'benchmark'

POOL_SIZE = 100

def get(users)

	time = Benchmark.measure{
		jobs = Queue.new

		users.times{|i| jobs.push i}

		workers = (POOL_SIZE).times.map do
		  Thread.new do
		    begin      
		      while x = jobs.pop(true)
		        response = open('https://mpaladoros-app.herokuapp.com/games/#_=_').read

		      end
		    rescue ThreadError
		    end
		  end
		end
		workers.map(&:join)
	}
	return time
end



puts get(10)