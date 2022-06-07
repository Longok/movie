class Showtime < ApplicationRecord
  belongs_to :room
  belongs_to :cinema

  validates :time, presence: true, uniqueness: true
  validates :room_id, presence: true

  def in_date
    time.strftime('%d-%m-%Y')
  end

  def in_time
    time.strftime('%I: %M %p')
  end

  def show_at
    time.strftime('%I: %M %p %d-%m-%Y')
  end
end
