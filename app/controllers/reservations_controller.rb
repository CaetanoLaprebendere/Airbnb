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
       redirect_to [@listing, @reservation]
     else
       redirect_to new_listing_reservation(@listing)
    end
  end
  
  def show
    @listing = Listing.find(params[:listing_id])
    @reservation = Reservation.find(params[:id])
    @client_token = Braintree::ClientToken.generate
  end
  
  def destroy
  @reservation = Reservation.find(params[:id])
  @reservation.destroy
  flash[:notice] = "the reservation was canceled"
  redirect_to root_path
  end


  def checkout

  nonce_from_the_client = params[:checkout_form][:payment_method_nonce]

  result = Braintree::Transaction.sale(
   :amount => "10.00", #this is currently hardcoded
   :payment_method_nonce => nonce_from_the_client,
   :options => {
      :submit_for_settlement => true
    }
   )

  if result.success?

    @listing = Listing.find(params[:listing_id])
    @reservation = Reservation.find(params[:id])
     ReservationMailer.booking_email(current_user, @listing.user, @reservation.id).deliver_later
     # @listing = Listing.find(params[:listing_id])
     # @reservation= Reservation.find(params[:id])
    redirect_to :root, :flash => { :success => "Transaction successful!" }
  else
    redirect_to :root, :flash => { :error => "Transaction failed. Please try again." }
  end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out)
  end 


end

