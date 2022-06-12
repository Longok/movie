class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :showtime, null: false, foreign_key: true
      t.references :seat, null: false, foreign_key: true

      t.timestamps
    end
  end
end
