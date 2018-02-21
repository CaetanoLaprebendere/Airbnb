class ListingsController < ApplicationController
	def new
		@user = params[:user_id]
		@listing = Listing.new
		render template: "listings/new"
	end

	def create
	   @listing = Listing.new(listings_params)
	   @user = User.find(params[:user_id])
	   @listing.user_id = @user.id
	   if @listing.save
	   redirect_to user_listing_path(@user, @listing)
	   flash[:notice] = "you have successfully created your listing"
		else
		render template:"welcome/index" 
		end 
	end 

	def show
		@listing = Listing.find(params[:id]) 
		render template: "listings/show"

	end

	def verify
		@listing = Listing.find(params[:id])
		@listing.verified = true
		@listing.save
		redirect_to user_listing_path(current_user, @listing)
	end

private 

	def listings_params
		params.require(:listing).permit(:title, :price, :location, :avatar)
	end 
end
