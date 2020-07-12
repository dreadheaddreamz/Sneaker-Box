class Shoe < ApplicationRecord
  belongs_to :brand
  belongs_to :user
  has_many :reviews
  has_many :users, through: :reviews
  accepts_nested_attributes_for :brand

  validates :name, presence: true


  def brand_attributes=(attributes)
    self.brand = Brand.find_or_create_by(attributes) if !attributes['name'].empty?
    self.brand
  end


  def brand_name
    brand.try(:name)
  end


  def name_and_brand
    "#{name} - #{brand.try(:name)}"
  end

end
