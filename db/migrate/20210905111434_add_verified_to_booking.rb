class AddVerifiedToBooking < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :verified, :boolean
  end
end
