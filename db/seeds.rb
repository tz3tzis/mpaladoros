# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
	
	require 'benchmark'

	def datatime
		time = Benchmark.measure{
			1.upto(10000) do |i| 
				game = Game.create(:name => 'Game #{i}', :start_time => "21:00:00", :end_time => "23:00:00",
					:admin_id => "3", :stadium_id => "1", :hometeam_id => "2", :awayteam_id => "3")
			end	
		}
		time_plus = Benchmark.measure{
				gma = Game.create(:name => 'Game +++', :start_time => "21:00:00", :end_time => "23:00:00",
					:admin_id => "3", :stadium_id => "1", :hometeam_id => "2", :awayteam_id => "3")
		}
		puts time
		puts time_plus
	end

 datatime