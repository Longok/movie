class Room < ApplicationRecord
    has_many :seats

    validates :name, uniqueness: true, presence: true, length: {minimum: 2}
end
