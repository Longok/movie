class Booking < ApplicationRecord
  belongs_to :cinema
  belongs_to :seat
  belongs_to :showtime
end
