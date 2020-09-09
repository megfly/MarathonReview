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
        if @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.image = auth['info']['image']
                if @user.save 
                    session[:user_id] = @user.id 
                    redirect_to user_path(@user)
        else 
            @user = User.find_by(email: params[:user][:email]) #params from login form 
 
                if @user && @user.authenticate(params[:user][:password])
                    session[:user_id] = @user.id #save the user id inside browser cookies and login
                    flash[:error] = "Login successful!"
                    redirect_to user_path(@user)
                else 
                    flash[:error] = "Please try again!"
                    redirect_to '/login'
                end 
            end 
            end 
        end
    end 

    #request.env
    #request.env['omniauth.auth']

    def edit 
    end

    def update 
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