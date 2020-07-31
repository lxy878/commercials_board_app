class State < ApplicationRecord
    has_many :commercials
    has_many :users, through: :commercials
    
    validates :name, presence: true
end
