class UsersController < ApplicationController

    def index 
    end 

    def show
    end 

    def new
    end 

    def create
        @user = User.create(user_params)
        if @user.save 
            session[:user_id] = @user.id 
            redirect_to '/'
        else 
            redirect_to '/users/new'
        end 
    end 

    def edit 
    end

    def update 
    end 

    def destroy
    end

    private 

    def user_params
        params.require(:user).permit(:email, :password)
    end
end

#https://launchschool.com/blog/integrating-rails-and-bootstrap-part-2
