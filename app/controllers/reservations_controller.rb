class ReservationsController < ApplicationController

  before_action :require_login

  def new 
    @reservation = Reservation.new
    render template: "reservations/new"
  end
  
  def create 
    @listing = Listing.find(params[:listing_id])
    @reservation = current_user.reservations.new(reservation_params)
    @reservation.listing_id = @listing_id
    @reservation.total_price = ((@reservation.check_in - @reservation.check_out) * @reservation.listing.price).to_i
    if @reservation.save
       redirect_to [@listing, @reservation]
     else
       redirect_to new_listing_reservation(@listing)
    end
  end
  
  def show
   @listing = Listing.find(params[:listing_id])
    @reservation = Reservation.find(params[:id])
  end
  
  private

  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out)
  end 

end

