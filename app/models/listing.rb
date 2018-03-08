class Listing < ApplicationRecord
  belongs_to :user
  mount_uploader :avatar, AvatarUploader
  has_many :reservations
 
  scope :location, -> (a) {where("location ILIKE ?", "%#{a}%")}

  scope :min_price, -> (a) {where("price > ?", a)}
  scope :max_price, -> (a) {where("price < ?", a)}

  # def self.location(a)
  #   where(location: a)
  # end 

  # Listing.location("tokyo")

  # def self.minimum(a)
  #   where(price > 50)
  # end 


  # def self.maximum(100)
  #   where.(price < 100)
  # end 




end


