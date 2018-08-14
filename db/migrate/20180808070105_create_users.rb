class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.timestamps null: false
      t.string :first_name,null: false
      t.string :last_name,null: false
      t.string :email, null: false
      t.string :phone
      t.integer :role, dafault: 0
      t.string :country
      t.string :city
      t.date :birthdate,null: true
      t.string :avatar
      t.string :encrypted_password, limit: 128, null: false
      t.string :confirmation_token, limit: 128
      t.string :remember_token, limit: 128, null: true
    end

    add_index :users, :email
    add_index :users, :remember_token
  end
end
