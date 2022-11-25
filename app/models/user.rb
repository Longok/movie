class User < ApplicationRecord
    has_many :payments

    before_save { self.email = email.downcase }

    validates :name, presence: true
    validates :password, presence: true, length: { minimum: 6 }

    EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: true, length: {minimum: 4}, format: {with: EMAIL_REGEX}

    has_secure_password

    def User.digest string
        cost = if ActiveModel::SecurePassword.min_cost
                    BCrypt::Engine::MIN_COST
                else
                    BCrypt::Engine.cost
                end
        BCrypt::Password.create string, cost: cost
    end

    def admin?
        self.email == 'longadmin@gmail.com'
    end

    # after_create do
    #     Stripe::Customer.create(email: self.email)
    # end
    # Disable Stripe in product railway
end
