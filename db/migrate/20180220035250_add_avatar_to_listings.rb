class AddAvatarToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :avatar, :string
  end
end
