class SessionsController < ApplicationController
    
    # log in
    def new  
    end

    def create
        # log in by Github
        if auth 
            user = User.create_by_auth(auth)
            session[:user_id] = user.id
            redirect_to user_path(user)

        else    # normal log in
            user = User.find_by(username: params[:username])
            if user && user.authenticate(params[:password])
                session[:user_id] = user.id
                redirect_to user_path(user)
            else
                flash[:login_error] = 'Error: Wrong User Name or Password'
                redirect_to root_path
            end
        end
    end

    # log out
    def destroy
        session.clear
        redirect_to root_path
    end

    private

    def auth
        request.env['omniauth.auth']    
    end
end
