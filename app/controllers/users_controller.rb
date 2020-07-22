class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            # display errors
            redirect_to signup_path
        end 
    end

    def show
        @user = current_user
    end

    def edit
        @user = current_user
    end

    def update
        @user = current_user
        @user.update(user_params)
        redirect_to user_path(@user)
    end

    private
    
    def user_params
        params.require(:user).permit(:username, :password, :email, :phone_number)
    end
end
