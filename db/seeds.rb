
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Tag.create(name: "Infrant suitable")
Tag.create(name: "Events or parties allowed")
Tag.create(name: "Pets Allowed")
Tag.create(name: "Smoking allowed")
Tag.create(name: "Children suitable")
# Tag.create(name: "Essentials")
# Tag.create(name: "Gym")
# Tag.create(name: "Air conditioning")
# Tag.create(name: "Pool")
# Tag.create(name: "TV")


# Random genereate user!
user = {}
user['password'] = 'asdf'

ActiveRecord::Base.transaction do
  20.times do 
    user['first_name'] = Faker::Name.first_name 
    user['last_name'] = Faker::Name.last_name
    user['email'] = Faker::Internet.email
    user['phone'] = Faker::PhoneNumber.phone_number
    user['country'] = Faker::Address.country
    user['city'] = Faker::Address.city
    user['birthdate'] = Faker::Date.birthday(18,90)
    
    User.create(user)
  end  
end   


listing = {}
uids = [] #user_id
tag = []
User.all.each { |u| uids << u.id }
Tag.all.each { |t| tag << t.name }


ActiveRecord::Base.transaction do
  20.times do 
    listing['name'] = Faker::App.name
    listing['property_type'] = ["House", "Entire Floor", "Condominium", "Villa", "Townhouse", "Castle", "Treehouse", "Igloo", "Yurt", "Cave", "Chalet", "Hut", "Tent", "Other"].sample
    listing['country'] = Faker::Address.country
    listing['city'] = Faker::Address.city
    listing['address'] = Faker::Address.street_address
    listing['price'] = rand(80..500)
    listing['description'] = Faker::Hipster.sentence
    listing['user_id'] = uids.sample
    listing['house_rules'] = tag.sample
    Listing.create(listing)
   end
end

tagging = {}
tids = [] #tag_id
Tag.all.each { |t| tids << t.id }
Listing.all.each do |l|
  rand(2..6).times do
    tagging['listing_id'] = l.id
    tagging['tag_id'] = tids.sample
    Tagging.create(tagging)
  end
end

# ActiveRecord::Base.transaction do