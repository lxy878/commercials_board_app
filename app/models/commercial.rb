class Commercial < ApplicationRecord
    belongs_to :user
    belongs_to :state
    has_many :comments
    has_many :users, through: :comments

    # validations

    # add states
end
