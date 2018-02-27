# class BraintreeController < ApplicationController
  
#   def new    
#   @client_token = Braintree::ClientToken.generate
#   end

#   def checkout
#   nonce_from_the_client = params[:checkout_form][:payment_method_nonce]

#   result = Braintree::Transaction.sale(
#    :amount => "10.00", #this is currently hardcoded
#    :payment_method_nonce => nonce_from_the_client,
#    :options => {
#       :submit_for_settlement => true
#     }
#    )

#   if result.success?
#      # ReservationMailer.booking_email(current_user, @listing.user, @reservation.id).deliver_later
#      # @listing = Listing.find(params[:listing_id])
#      # @reservation= Reservation.find(params[:id])
#     redirect_to :root, :flash => { :success => "Transaction successful!" }
#   else
#     redirect_to :root, :flash => { :error => "Transaction failed. Please try again." }
#   end
#   end

# end