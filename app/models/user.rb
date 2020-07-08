class User < ApplicationRecord
    has_many :reviews
    has_many :shoes, through: :reviews

    has_many :kicks
end
