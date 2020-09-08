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
        if session[:user_id]
              @current_user ||= User.find(session[:user_id])
        else
              @current_user = nil
        end
    end 

    def user_signed_in?
        !!current_user
    end
    
end
