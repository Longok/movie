class Room < ApplicationRecord
    has_many :seats, dependent: :destroy
    has_many :days, dependent: :destroy
    has_many :showtimes, through: :days

    
    validates :name, uniqueness: true, presence: true, length: {minimum: 2}
end
