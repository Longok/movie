class Seat < ApplicationRecord
  belongs_to :room
  has_many :bookings

  validates :name, uniqueness: true, presence: true, length: {minimum: 2}
  validates :room_id, presence: true

  scope :by_showtime, ->(showtime_id) {
    joins("INNER JOIN rooms ON seats.room_id = rooms.id
           LEFT JOIN showtimes ON showtimes.room_id = rooms.id
           LEFT JOIN bookings ON bookings.showtime_id = showtimes.id AND bookings.seat_id = seats.id")
      .select('seats.*, CASE WHEN bookings.id NOTNULL THEN TRUE ELSE FALSE END AS booked')
      .where("showtimes.id = :showtime_id", showtime_id: showtime_id)
  }

 
end
