class CommercialsController < ApplicationController
    before_action :authentication_required
    def index
        if params[:user_id]
            # previde directly editting id
            if session[:user_id] == params[:user_id].to_i
                @user = current_user
                @commercials = @user.commercials
            else
               redirect_to user_path(current_user) 
            end
        else
            @commercials = Commercial.all
        end
    end

    def show
        if params[:user_id]
               # previde directly editting id
            if session[:user_id] == params[:user_id].to_i
                @user = current_user
                raise params.inspect
            else
               redirect_to user_path(current_user) 
            end
        else

        end
    end

    def new
    end

    def create
    end

    def edit

    end

    def update
    end

    def delete
    end

    private
    
    # def test(id)
    #     if @user = User.find_by(id: id)
    #         @user
    #     else
    #         'not find.'
    #     end
    # end
end
