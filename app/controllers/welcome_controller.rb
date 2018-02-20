class WelcomeController < ApplicationController
	def index
		@user = current_user
		@listings = Listing.all
	end	
end
