class WelcomeController < ApplicationController
	def index
		@user = current_user
        #listing.user
        #listing.reservations
		@listings = Listing.includes(:user, :reservations).all
    
    # @listings_uniq = @listings.uniq! 
    # @json_listings = @listings.map do |x|
    #   x.location 
    # end
    arr = []
    @listings.each do |l| 
      arr << l.location.to_s 
    end 
    arr = arr.uniq 
    puts arr 
    @json_listings = arr 

    respond_to do |format|
      format.html 
      format.json { render json: @json_listings }
    end
	end	
end
