class Commercial < ApplicationRecord
    belongs_to :user
    belongs_to :state
    has_many :comments
    has_many :users, through: :comments
    
    validates :title, :description, :state_id, presence: true

    def state_attributes=(state_hash)
        self.state = State.find_or_create_by(state_hash)
    end

    def comments_desc
        self.comments.order(created_at: :desc)
    end
    
    def self.by_user(user_id)
        where(user: user_id)
    end

    def self.by_state(state_id)
        where(state: state_id)
    end

    def self.by_user_and_id(user_id, commercial_id)
        where(user: user_id, id: commercial_id)
    end
end
