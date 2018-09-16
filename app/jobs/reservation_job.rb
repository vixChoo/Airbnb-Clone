class ReservationJob < ApplicationJob
  queue_as :default

  def perform(user,reservation)
       ReservationMailer.booking_email(user,reservation).deliver
  end
end
