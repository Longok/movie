class Showtime < ApplicationRecord
  belongs_to :room

  validates :time, presence: true
  validates :room_id, presence: true

  def in_date
    time.strftime('%Y-%m-%d')
  end

  def in_time
    time.strftime('%I: %M %p')
  end

  def show_at
    time.strftime('%I: %M %p %Y-%m-%d')
  end
end
