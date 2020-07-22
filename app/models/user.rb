class User < ApplicationRecord
    has_secure_password
    
    has_many :commercials
    has_many :comments
    has_many :commented_commercials, through: :comments, source: :commercial

    validates :username, presence: true, uniqueness: true
end
