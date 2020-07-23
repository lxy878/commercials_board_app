class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :commercial

    validates :content, presence: true
end
