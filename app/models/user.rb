class User < ApplicationRecord
    has_secure_password

    has_many :reviews
    has_many :runs, through: :reviews

    validates :email, presence: true, uniqueness: true 

    def self.find_or_create_from_auth_hash(auth)
        where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
            user.provider = auth.provider
            user.uid = auth.uid
            user.email = auth.info.email
            user.name = auth.info.name 
            user.image = auth.info.image
            user.save!
        end 
    end

end
