module GamesHelper

	require 'open-uri'
	require 'benchmark'

	def get_test(count)
		threads = []
		count = 0
		time = Benchmark.measure{
			1.upto(count) do
				threads << Thread.new do 
					response = open('https://mpaladoros-app.herokuapp.com/users/auth/facebook').read
					count += 1
				end
			end
			threads.map(&:join)
		}
		return time,count
	end

end
