class Booking < ApplicationRecord
  belongs_to :showtime
  belongs_to :seat
  has_many :payments

  validates :seat_id, uniqueness: { message: 'Đã tồn tại!' }

end
