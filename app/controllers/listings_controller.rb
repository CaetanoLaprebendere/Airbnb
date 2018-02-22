class ListingsController < ApplicationController
	def new
		@user = params[:user_id]
		@listing = Listing.new
		render template: "listings/new"
	end

	def create
	   @listing = current_user.listings.new(listings_params)
	   if @listing.save
		   redirect_to listing_path(@listing)
		   flash[:notice] = "you have successfully created your listing"
		else
			 flash[:notice] = "you have failed to create your listing"
			 redirect_to new_listing_path(@user, @listing)		
		end 
	end 

	def show
		@listing = Listing.find(params[:id]) 
		render template: "listings/show"
	end

  def edit
	  @listing = Listing.find(params[:id])	  
	  redirect_to edit_listing_path(@listing)
  end

  def update
  	@listing = Listing.find(params[:id])
	  if @listing.update(listing_params)
	  	redirect_to listing_path(@listing)
	  else 
	    redirect_to edit_listing_path(@listing)
	  flash[:notice] = "edit failed"
	  end  	
  end

	def verify
		@listing = Listing.find(params[:id])
		@listing.verified = true
		@listing.save
		flash[:notice] = "you verified this listing"
		redirect_to listing_path(@listing)
	end

	def destroy
	@listing = Listing.find(params[:id])
	@listing.destroy
	flash[:notice] = "the listing was deleted"
	redirect_to root_path
	end

private 

	def listings_params
		params.require(:listing).permit(:title, :price, :location, :avatar)
	end 
end
