class User < ApplicationRecord
	include Clearance::User

 has_many :authentications, dependent: :destroy
 has_many :listings
 has_many :reservations

 

 enum roles: [ :customer, :moderator, :superadmin]

# # conversation.update! status: 0
# conversation.active!
# conversation.active? # => true
# conversation.status  # => "active"

# # conversation.update! status: 1
# conversation.archived!
# conversation.archived? # => true
# conversation.status    # => "archived"

# # conversation.status = 1
# conversation.status = "archived"

# conversation.status = nil
# conversation.status.nil? # => true
# conversation.status      # => nil

 def self.create_with_auth_and_hash(authentication, auth_hash)
   user = self.create!(
     name: auth_hash["info"]["name"],
     password: SecureRandom.hex(10),
     email: auth_hash["extra"]["raw_info"]["email"]
   )
   user.authentications << authentication
   return user
 end

 # grab fb_token to access Facebook for user data
 def fb_token
   x = self.authentications.find_by(provider: 'facebook')
   return x.token unless x.nil?
 end
end