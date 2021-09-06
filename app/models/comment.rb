class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :commercial

    validates :content, presence: true

    def self.desc_order
        order(created_at: :desc)
    end
end
