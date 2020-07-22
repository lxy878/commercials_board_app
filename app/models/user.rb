class User < ApplicationRecord
    has_secure_password
    
    has_many :commericals
    has_many :comments
    has_many :commented_commercials, through: :comments, source: :commerical

    validates :username, presence: true, uniqueness: true
end
