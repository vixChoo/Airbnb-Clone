class Reservation < ApplicationRecord
    belongs_to :listing
    belongs_to :user

    validate :check_overlapping

    


    def check_overlapping
        listing.reservations.each do |old_booking|
            if overlap?(self,old_booking)
                if self == old_booking
                    return true
                else
                    errors.add(:overlapping_dates , "These dates is not available.")
             
               end
           end
       end
   end
   
       def overlap?(current_booking,old_booking)
           (current_booking.start_date - old_booking.end_date) * (old_booking.start_date - current_booking.end_date) > 0 
           
       end
              
                  
                          
end
