class User < ApplicationRecord
    has_secure_password

    has_many :reviews
    has_many :runs, through: :reviews

    validates :email, presence: true, uniqueness: true 
end
