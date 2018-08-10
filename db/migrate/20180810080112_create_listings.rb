class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :name
      t.integer :price
      t.string :description
      t.string :address
      t.string :country
      t.string :city
      t.string :house_rules
      t.string :property_type
      t.string :facility
      t.string :amenity

      t.timestamps
    end
  end
end
