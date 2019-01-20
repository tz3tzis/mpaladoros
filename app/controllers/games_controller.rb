class GamesController < ApplicationController

	include GamesHelper

	before_action :authenticate_user!
	before_action :assign_ip

	def index
		
		@games = Game.all
		@games = @games.paginate(:page => params[:page], :per_page => 4)
		@admin=Admin.all.find_by(@game.admin_id) if !current_game.nil?

		#===========test sumultaneous users=========
		#@time = get_test(10) 
		#puts @time 
		#==========================================

	end

	def new
		@game = Game.new
		@stadia = Stadium.all
	end


	def create
		#Αναθέτουμε στον αγώνα το γήπεδο 
		#που επιλέχθηκε απο τον χρήστη
		@game = Game.new(game_params)
		@stadium = Stadium.find_by(stadium_name: "#{@game.name}")
		@game.stadium_id = @stadium.id
		#Πέρνουμε τον χρόνο και την ημερομηνία 
		#απο την προβολή τα ένωνουμε και τα περναμε 
		#στην μεταβλητη start_time
		date = params['game']['start_time']
		time = params['game']['time']
		@game.start_time = Time.parse("#{date} #{time}") 
		#Οι αγώνες έχουν διάρκεια 90 λεπτά
		@game.admin_id = @stadium.admin_id 
		@game.end_time = @game.start_time + 90.minutes
		# Δημιουργούνται δύο νέες ομάδες με προκαθορισμένα 
		# ονόματα και χωρητικότητα ανάλογη του γηπέδου
		@team1 = Team.create(name: 'home')
		@team1.capacity = (@stadium.max_players) / 2
		@team1.save
		@team2 = Team.create(name: 'away')
		@team2.capacity = (@stadium.max_players) / 2
		@team2.save
		# Αναθέτωνται στον αγώνα οι δύο ομάδες 
		#που δημιουργήσαμε παραπάνω
		@game.hometeam_id = @team1.id
		@game.awayteam_id = @team2.id
		#Ο παίκτης που δημιουργεί το παιχνίδι 
		#ανατίθεται στην πρώτη ομάδα
		@team1.users << current_user


		#save game
		if @game.save 
			#@stadium.save!
			flash[:notice] = "Το παιχνιδι δημιουργήθηκε επιτυχώς"
			redirect_to games_path
		else
			flash[:notice] = "Ούπς , κατι πηγε στραβά"
			render :new
		end

	end


	def delete()
		Game.find(params[:id]).destroy
		redirect_to games_path
	end


	private

		def assign_ip
		 	@user = current_user
		 	@user.ip_address = @user.current_sign_in_ip.to_s
		 	@user.save!
	 	end

		def game_params
			params.
				require(:game).
					permit(:id, :start_time, :end_time, :name ,:admin_id)
		end

end
