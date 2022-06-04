class Room < ApplicationRecord
    has_many :seats, dependent: :destroy
    has_many :showtimes, dependent: :destroy


    validates :name, uniqueness: true, presence: true, length: {minimum: 2}
end
