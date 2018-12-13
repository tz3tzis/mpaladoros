module GamesHelper

	require 'open-uri'
	require 'benchmark'

	def get_test(count)
		time = Benchmark.realtime{
			1.upto(count) do |i|
				response = open('https://mpaladoros-app.herokuapp.com/').read
			end
		}
		return time
	end


end
