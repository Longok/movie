class Showtime < ApplicationRecord
  belongs_to :day

  DAY_ID = [1,2,3,4,5,6,7] 

  validates :time, presence: true
  validates :day_id, inclusion: DAY_ID


end
