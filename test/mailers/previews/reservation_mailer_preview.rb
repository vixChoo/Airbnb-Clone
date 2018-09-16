# Preview all emails at http://localhost:3000/rails/mailers/reservation_mailer
class ReservationMailerPreview < ActionMailer::Preview
def booking_email
    ReservationMailer.with(user: User.first).booking_email
  end
end
