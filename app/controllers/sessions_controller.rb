class SessionsController < ApplicationController
    def new  
    end

    def create
        if auth 
            # refactor: in model
            user = User.find_or_create_by(uid: auth[:uid]) do |u|
                u.username = auth[:info][:name]
                u.password = SecureRandom.hex
                u.email = auth[:info][:email]
            end

            session[:user_id] = user.id
            redirect_to user_path(user)

        else
            user = User.find_by(username: params[:username])
            if user && user.authenticate(params[:password])
                session[:user_id] = user.id
                redirect_to user_path(user)
            else
                # TODO: display errors
                redirect_to root_path
            end
        end
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
