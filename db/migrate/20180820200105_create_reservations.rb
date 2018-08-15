class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
        t.belongs_to :user, foreign_key: true
        t.belongs_to :listing, foreign_key: true
        t.integer :status, dafault: 0
        t.date :start_date
        t.date :end_date
      
        
      
        t.timestamps null: false
    end
  end
end
