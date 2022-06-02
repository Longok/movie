class Seat < ApplicationRecord
  belongs_to :room

  validates :name, uniqueness: true, presence: true, length: {maximum: 3}
  validates :room_id, presence: true

end
