class Booking < ApplicationRecord
  belongs_to :showtime
  belongs_to :seat
  has_many :payments

end
