class Listing < ApplicationRecord
  belongs_to :user
  mount_uploader :avatar, AvatarUploader
 
  scope :location, -> (a) {where("location like ?", "%#{a}%")}

end


