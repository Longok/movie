class Day < ApplicationRecord
  belongs_to :room

  DAY = ["monday", "tuesday", "wedensay", "thursday", "friday", "saturday", "sunday"]
  ROOM_ID = [1, 2, 3, 4, 5]

  validates :name, inclusion: DAY
  validates :room_id, inclusion: ROOM_ID

end
