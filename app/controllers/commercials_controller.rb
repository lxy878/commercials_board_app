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
            # move to model
            @commercials = @commercials.where(user_id: params[:uid]) if params[:uid].present? 
            @commercials = @commercials.where(state_id: params[:state_id]) if params[:state_id].present?
            @commercials.order(updated_at: :desc)
        end

    end

    def show
        if params[:user_id]
               # previde directly editting id
            if session[:user_id] == params[:user_id].to_i
                @user = @current_user
                # move to medol
                @commercial = @user.commercials.where(id: params[:id]).first
                redirect_to user_commercials_path(@user) if !@commercial   
            else
               redirect_to user_path(@current_user) 
            end
        else
            @commercial = Commercial.find(params[:id])
            @user = @commercial.user
        end
        # comments desc order
    end

    def new
        #  fix user_id 
        @commercial = Commercial.new
        @state = State.new
    end

    def create
        #  fix user_id 
        @commercial = @current_user.commercials.build(commercial_params)
        if @commercial.save
            redirect_to user_commercial_path(@current_user, @commercial)
        else
            # display errors
            redirect_to new_user_commercial_path(@current_user)
        end
    end

    def edit
        # fix user_id and move to medol
        @commercial = @current_user.commercials.where(id: params[:id]).first
        @state = @commercial.state
        redirect_to user_commercials_path(@current_user) if !@commercial
        
    end

    def update
        @commercial = Commercial.find(params[:id])
        if @commercial.update(commercial_params)
            redirect_to user_commercial_path(@current_user, @commercial)
        else
            # display errors
            redirect_to edit_user_commercial_path(@current_user, @commercial)
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
