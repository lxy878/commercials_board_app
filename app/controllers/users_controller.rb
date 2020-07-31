class UsersController < ApplicationController
    before_action :authentication_required, only: [:show, :edit, :update]
    # sign up
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end 
    end

    def show
    end

    def edit
    end

    def update
        @current_user.update(user_params)
        redirect_to user_path(@current_user)
    end

    private
    
    def user_params
        params.require(:user).permit(:username, :password, :email, :phone_number)
    end
end
