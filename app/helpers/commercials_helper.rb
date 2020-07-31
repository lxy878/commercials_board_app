module CommercialsHelper
    def link_back(user)
        if params[:user_id]
            link_to "Back to #{user.username}'s Commericals Page", user_commercials_path(user)
        else
            link_to 'Back to Commericals Page', commercials_path
        end
    end

    def link_commercial(commerical, user)
        if user
            link_to commerical.title, user_commercial_path(user, commerical)
        else
            link_to commerical.title, commercial_path(commerical)
        end
    end
end
