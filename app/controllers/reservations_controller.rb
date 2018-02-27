class ReservationsController < ApplicationController

  before_action :require_login

  def new 
    @reservation = Reservation.new
    @listing = Listing.find(params[:listing_id])
    render template: "reservations/new"
  end
  
  def create 
    @listing = Listing.find(params[:listing_id])
    @reservation = current_user.reservations.new(reservation_params)
    @reservation.listing_id = @listing.id
    @reservation.total_price = ((@reservation.check_out - @reservation.check_in) * @reservation.listing.price).to_i
    if @reservation.save
        ReservationMailer.booking_email(current_user, @listing.user, @reservation.id).deliver_later

       redirect_to [@listing, @reservation]
     else
       redirect_to new_listing_reservation(@listing)
    end
  end
  
  def show
   @listing = Listing.find(params[:listing_id])
    @reservation = Reservation.find(params[:id])
  end
  
  def destroy
  @reservation = Reservation.find(params[:id])
  @reservation.destroy
  flash[:notice] = "the reservation was canceled"
  redirect_to root_path
  end

  private

  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out)
  end 


end

