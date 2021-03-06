class Listing < ApplicationRecord
   has_many :taggings, dependent: :destroy
   has_many :tags, through: :taggings
   has_many :reservations, dependent: :destroy
   belongs_to :user
   paginates_per 12
   mount_uploaders :images, ImageUploader

   def self.search(term)
    self.where("lower(name) LIKE ? OR lower(description) LIKE ? OR lower(address) LIKE ? " , "%#{term}%" , "%#{term}%" , "%#{term}%")
  end

   def self.price_range(minimum_price,maximum_price)
   self.where("price >= ? AND price <= ?" ,minimum_price,maximum_price)
   end
  



    def self.tagged_with(name)
    Tag.find_by!(name: name).listings
  end

  # def self.tag_counts
  #   Tag.select('tags.*, count(taggings.tag_id) as count').joins(:taggings).group('taggings.tag_id')
  # end

  def self.tag_counts
      Tag.select("tags.id, tags.name,count(taggings.tag_id) as count").
      joins(:taggings).group("taggings.tag_id, tags.id, tags.name")
  end    

  def tag_list
    tags.map(&:name).join(', ')
  end

  def tag_list=(names)
    self.tags = names.split(',').map do |n|
      Tag.where(name: n.strip).first_or_create!
    end 
  end 


end
