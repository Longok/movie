class Showtime < ApplicationRecord
  belongs_to :day
  belongs_to :room

  DAY_ID = [1,2,3,4,5,6,7] 
  ROOM_ID = [1, 2, 3, 4, 5]

  validates :time, presence: true
  validates :room_id, inclusion: ROOM_ID
  validates :day_id, inclusion: DAY_ID


end
