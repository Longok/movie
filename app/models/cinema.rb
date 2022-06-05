class Cinema < ApplicationRecord

    has_one_attached :image

    validates :name, presence: true, length: { minimum: 6}
    validates :year, presence: true, length: { minimum: 4}
    validates :time, presence: true, length: { minimum: 2}
    validates :image, presence: true
end
