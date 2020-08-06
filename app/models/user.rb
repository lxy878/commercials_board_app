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
    def self.most_commercial_user
        # create a join table of user_commercial
        # count row numbers of the same usernames and return a hash with username and commercial counts
        # find max count in the hash and return an array of the maximum commercial count with its key
        joins(:commercials).group(:username).count.max_by{|username, commercial_count| commercial_count}
    end
    # ---------- end ----------------
end
