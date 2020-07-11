class Brand < ApplicationRecord
    has_many :shoes
    validates :name, presence: true
end
