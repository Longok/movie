class Booking < ApplicationRecord
  belongs_to :showtime
  belongs_to :seat

  validates :seat_id, uniqueness: { message: 'Da duoc dat!' }
end
