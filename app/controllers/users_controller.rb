class UsersController < ApplicationController

    def show
        @user = User.find_by_id(params[:id])
    end 

    def new
        @user = User.new 
    end 

    def create
        @user = User.create(user_params)
        if @user.save 
            session[:user_id] = @user.id 
            redirect_to user_path(@user) #user show page 
        else 
            redirect_to '/signup'
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
