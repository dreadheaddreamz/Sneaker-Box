class Shoe < ApplicationRecord
  belongs_to :brand
  belongs_to :user
  has_many :reviews
  has_many :users, through: :reviews
  accepts_nested_attributes_for :brand

  validates :name, presence: true

  validate :not_a_duplicate


  def not_a_duplicate
    shoe = Shoe.find_by(name: name, brand_id: brand_id)
    if !!shoe && shoe != self
      errors.add(:shoe, 'has already been added for that brand')
    end
  end

end
