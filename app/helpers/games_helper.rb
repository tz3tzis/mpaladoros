module GamesHelper

	require 'open-uri'
	require 'benchmark'

	def get_test(users)
		time = Benchmark.realtime{
			1.upto(users) do |i|
				response = open('https://mpaladoros-app.herokuapp.com').read
			end
		}
		return time
	end


end
