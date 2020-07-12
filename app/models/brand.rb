class Brand < ApplicationRecord
    has_many :shoes
    validates :name, presence: true, uniqueness: true
end
