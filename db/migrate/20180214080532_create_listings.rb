class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.belongs_to :user, index: true	
      t.string :title 
      t.integer :price
      t.string :location
      t.timestamps
    end
  end
end
