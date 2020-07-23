class State < ApplicationRecord
    has_many :commercials

    validates :name, presence: true
end
