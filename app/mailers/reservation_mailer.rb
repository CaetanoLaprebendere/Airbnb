class ReservationMailer < ApplicationMailer
  default from: 'tourdeplantsnyc@gmail.com'


  def booking_email(x, y ,z )
    @customer = x
    @host = y
    @reservation_id = z

    mail(to: @host.email, subject: 'Your home has a new guest to look forward to!')
  end

end
