class User < ApplicationRecord
    has_secure_password
    
    has_many :commercials
    has_many :states, through: :commercials
    has_many :comments
    has_many :commented_commercials, through: :comments, source: :commercial

    validates :username, presence: true, uniqueness: true

    def self.create_by_auth(auth)
        find_or_create_by(uid: auth[:uid]) do |u|
            u.username = auth[:info][:name]
            u.password = SecureRandom.hex
            u.email = auth[:info][:email]
        end
    end

    # --------- live coding ----------
    def self.commercial_user
        joins(:commercials).group(:username)
    end
    # ---------- end ----------------
end
