class Review < ApplicationRecord
  belongs_to :user
  belongs_to :shoe

  validates :title, presence: true
  validates :image, presence: true
  validates :heat, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than: 11}
  validates :shoe, uniqueness: { scope: :user, message: "You already reviewed these kicks"}
end
