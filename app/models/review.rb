class Review < ApplicationRecord
  belongs_to :user
  belongs_to :shoes
end
