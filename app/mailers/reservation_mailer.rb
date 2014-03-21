class ReservationMailer < ActionMailer::Base
  default from: "from@example.com"

  def send_reservation_email(reservation)
   @reservation = reservation
   mail( :to =>@reservation.email, :subject => 'Resevation confirmation')
  end
end

