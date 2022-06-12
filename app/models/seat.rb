class Seat < ApplicationRecord
  belongs_to :room
  has_many :bookings

  validates :name, uniqueness: true, presence: true, length: {minimum: 2}
  validates :room_id, presence: true

end
