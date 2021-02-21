class User < ApplicationRecord
	has_many :microposts, dependent: :destroy
	validates :name, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email, presence: true, length: { maximum: 255 },
format: { with: VALID_EMAIL_REGEX }
has_secure_password
    def self.search(search)
        if search 
            where(["name LIKE ?","%#{search}%"])
        else
            all
        end
    end 

end
