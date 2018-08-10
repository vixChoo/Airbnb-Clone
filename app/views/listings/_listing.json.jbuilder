json.extract! listing, :id, :name, :price, :description, :address, :country, :city, :house_rules, :property_type, :facility, :amenity, :created_at, :updated_at
json.url listing_url(listing, format: :json)
