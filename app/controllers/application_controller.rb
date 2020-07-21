class ApplicationController < ActionController::Base

    private
    
    def current_user
        User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def authentication_required
        if !logged_in?
            flash[:illegal_login] = 'Illegal Access!!!'
            redirect_to root_path
        end
    end
end
