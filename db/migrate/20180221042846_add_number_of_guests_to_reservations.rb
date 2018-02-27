class AddNumberOfGuestsToReservations < ActiveRecord::Migration[5.2]
  def change
  add_column :reservations, :number_of_guests, :integer, default: 1
  add_column :reservations, :total_price, :integer, default: 0
  end
end

