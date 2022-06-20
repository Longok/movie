class Booking < ApplicationRecord
  belongs_to :showtime
  belongs_to :seat

  validates :seat_id, uniqueness: { message: 'Đã tồn tại!' }

end
