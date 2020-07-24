class Commercial < ApplicationRecord
    belongs_to :user
    belongs_to :state
    has_many :comments
    has_many :users, through: :comments
    
    validates :title, :description, :state_id, presence: true

    def state_attributes=(state_hash)
        self.state = State.find_or_create_by(state_hash)
    end
end
