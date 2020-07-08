class User < ApplicationRecord 
    has_many :reviews
    has_many :shoes, through: :reviews

    has_many :kicks
    validates :username, uniqueness: true,  presence: true
    has_secure_password
    
end
