class UsersController < ApplicationController

    def show
        @user = User.find_by_id(params[:id])
    end 

    def new
        @user = User.new 
    end 

    def create
        @user = User.new(user_params)
        if @user.save 
            session[:user_id] = @user.id 
            flash[:error] = "Your account has been created!"
            redirect_to @user #user show page 
        else 
            flash[:error] = "Please try again!"
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
        params.require(:user).permit(:email, :password, :name, :image, :uid, :provider)
    end
end

#https://launchschool.com/blog/integrating-rails-and-bootstrap-part-2
