class SubscriptionsController < ApplicationController
	def create 
		session[:subscription] = JSON.dump(params.fetch(:subscription, {}))
	end
end

