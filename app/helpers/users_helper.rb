module UsersHelper
    def email(user)
        user.email ? user.email : 'None'
    end

    def phone_number(user)
        user.phone_number ? user.phone_number : 'None'
    end
end
