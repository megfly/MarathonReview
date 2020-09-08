class User < ApplicationRecord
    has_secure_password

    has_many :reviews
    has_many :runs, through: :reviews

    validates :email, presence: true, uniqueness: true 

    def self.create_with_omniauth(auth)

        #The ActiveRecord method find_or_create_by will find the user if the user exists or 
        #create a new user if the user does not exist. 
        #Then it will set the user to a variable called user. 
  
        user = find_or_create_by(uid: auth[‘uid’], provider:  auth[‘provider’]) 
        user.email = “#{auth[‘uid’]}@#{auth[‘provider’]}.com”
        user.password = auth[‘uid’]
        user.name = auth[‘info’][‘name’]

        #If the user exists, return user
        #Else, save new user in db and return user

        if User.exists?(user)
          user
        else
          user.save!
          user
        end
      end

      private 

      def auth
          request.env['omniauth.auth']
      end

end
