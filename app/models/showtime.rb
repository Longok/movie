class Showtime < ApplicationRecord
  belongs_to :room
  belongs_to :film
  has_many :bookings

  validates :time, presence: true, uniqueness: { scope: %i[room_id] }
  validates :room_id, presence: true
  # validate :uniquenes_of_room!

  def in_date
    time.strftime('%d-%m-%Y')
  end

  def in_time
    time.strftime('%I: %M %p')
  end

  def show_at
    time.strftime('%I: %M %p %d-%m-%Y')
  end

  def uniquenes_of_room!
    start_from = time
    end_to     = time + film.time.minutes
    return unless Showtime.joins(:film)
                          .where(room_id: room_id)
                          .where("showtimes.time <= :end_to and showtimes.time + (films.time ||' minutes')::interval >= :start_from", start_from: start_from, end_to: end_to)
                          .exists?

    errors.add(:room_id, :taken)
  end
end
