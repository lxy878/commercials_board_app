class User < ApplicationRecord
    has_secure_password
    
    # validations
    # username: require and unique
    # email: require
    # phone_number: require
end
