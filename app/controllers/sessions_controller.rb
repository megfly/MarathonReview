class SessionsController < ApplicationController

    def home 
    end 

    def index 
    end 

    def show
    end 

    def new
    end 

    def create
        @user = User.find_by(email: params[:user][:email]) #params from login form

        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id #save the user id inside browser cookies and login
            redirect_to user_path(@user)
        else 
            redirect_to '/login'
        end 
    end 

    def edit 
    end

    def update 
    end 

    def omniauth
        @user = User.from_omniauth(auth)
        @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end 

    def destroy
        session.clear 
        redirect_to root_path
    end

    private 

    def auth 
        request.env['omniauth.auth']
    end
end 