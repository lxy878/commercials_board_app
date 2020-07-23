class ApplicationController < ActionController::Base

    private
    
    def current_user
        @current_user = User.find_by(id: session[:user_id])
        # session has :user_id only if log in
            #once logged in, url has user_id
            # current_user only if session==params
        # otherwise, :user_id = nil
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
