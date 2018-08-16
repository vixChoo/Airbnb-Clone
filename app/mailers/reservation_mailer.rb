class ReservationMailer < ApplicationMailer
    default from: "vixtrumchoo@gmail.com"

    def booking_email(user,reservation)
        @user = user
        @reservation = reservation
        mail(to: @user.email, subject: 'Airbnb Booking - Vix')
    end

end
