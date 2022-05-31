class User < ApplicationRecord
    before_save { self.email = email.downcase }

    validates :name, presence: true
    validates :password, presence: true, length: { minimum: 6 }

    EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: true, length: {minimum: 4}, format: {with: EMAIL_REGEX}

    has_secure_password
end
