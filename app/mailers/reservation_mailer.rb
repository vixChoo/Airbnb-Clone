class ReservationMailer < ApplicationMailer
    default from: "vixtrumchoo@gmail.com"

    def booking_email(user,reservation_id)
        @user = user
        mail(to: @user.email, subject: 'Airbnb Booking - Vix')
    end

  


end
