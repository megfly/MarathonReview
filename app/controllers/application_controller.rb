class ApplicationController < ActionController::Base

    helper_method :current_user
    helper_method :user_signed_in?

    def welcome
    end 

    def redirect_if_not_logged_in
        if !user_signed_in?
            redirect_to '/'
        end 
    end

    def current_user 
        @current_user ||= User.find_by(id: session[:user_id])
    end 

    def user_signed_in?
        !!current_user
    end
    
end
