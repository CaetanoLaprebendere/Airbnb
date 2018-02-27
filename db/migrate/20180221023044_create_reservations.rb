class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.date :check_in
      t.date :check_out
      t.belongs_to :listing, index: true 
      t.belongs_to :user, index: true 
      t.integer :price
      t.timestamps
    end
  end
end
