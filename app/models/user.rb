class User < ApplicationRecord
    has_secure_password

    has_many :reviews
    has_many :runs, through: :reviews

    validates :email, presence: true, uniqueness: true 

    def self.from_omniauth(auth)
      @user = User.find_or_create_by(email: auth["info"]["email"]) do |user|
          user.password = SecureRandom.hex
        end
      end 

end
