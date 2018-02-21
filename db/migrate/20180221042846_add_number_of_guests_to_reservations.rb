class AddNumberOfGuestsToReservations < ActiveRecord::Migration[5.2]
  def change
  add_column :reservations, :number_of_guests, :integer, default: 1
  end
end
