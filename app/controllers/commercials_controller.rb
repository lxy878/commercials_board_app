class CommercialsController < ApplicationController
    before_action :authentication_required

    def index
        @users = User.all
        @states = State.all
        if params[:user_id]
            # previde directly editting id
            if session[:user_id] == params[:user_id].to_i
                @user = @current_user
                @commercials = @user.commercials
            else
               redirect_to user_path(@current_user) 
            end
        else
            @commercials = Commercial.all
        end

        # filter section
        if params[:uid].present?||params[:state_id].present?
            # -------- refactor ---------
            @commercials = @commercials.by_user(params[:uid]) if params[:uid].present? 
            @commercials = @commercials.by_state(params[:state_id]) if params[:state_id].present?
            @commercials = @commercials.desc_order
            # -------- end ---------
        end

    end

    def show
        if params[:user_id]
            # prevent directly editting id
            if session[:user_id] == params[:user_id].to_i
                @user = @current_user
                @commercial = Commercial.by_user_and_id(@user, params[:id]).first
                redirect_to user_commercials_path(@user) if !@commercial   
            else
               redirect_to user_path(@current_user) 
            end
        else
            @commercial = Commercial.find(params[:id])
            @user = @commercial.user
        end
    end

    def new
        if params[:user_id].to_i == session[:user_id]
            @commercial = Commercial.new
            @state = State.new
        else
            redirect_to user_commercials_path(@current_user)
        end
    end

    def edit
        if params[:user_id].to_i == session[:user_id] && @commercial = Commercial.by_user_and_id(@current_user, params[:id]).first
            @state = @commercial.state
        else
            redirect_to user_commercials_path(@current_user)
        end
    end

    def create
        @commercial = @current_user.commercials.build(commercial_params)
        if @commercial.save
            redirect_to user_commercial_path(@current_user, @commercial)
        else
            redirect_to new_user_commercial_path(@current_user), flash: {errors: @commercial.errors.full_messages}
        end
    end

    def update
        @commercial = Commercial.find(params[:id])
        if @commercial.update(commercial_params)
            redirect_to user_commercial_path(@current_user, @commercial)
        else
            redirect_to edit_user_commercial_path(@current_user, @commercial), flash: {errors: @commercial.errors.full_messages}
        end
    end

    def destroy
        Commercial.find(params[:id]).destroy
        redirect_to user_commercials_path(@current_user)
    end

    private
    
    def commercial_params
        params.require(:commercial).permit(:title, :description, state_attributes:[:name])
    end
end
