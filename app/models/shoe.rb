class Shoe < ApplicationRecord
  belongs_to :brand
  belongs_to :user
  has_many :reviews
  has_many :users, through: :reviews
  #accepts_nested_attributes_for :brand

  validates :name, presence: true
  validates :image, presence: true #prevent them from being saved to the database if their data doesn't look right.




  def brand_attributes=(attributes)
    self.brand = Brand.find_or_create_by(attributes) if !attributes['name'].empty? #finds or creates brands by name
    self.brand
  end


  def brand_name #finds brand name
    brand.try(:name)
  end


  def name_and_brand
   "#{name} - #{brand.try(:name)}" #try and find name or brand to display on user homepage
  end

  def self.latest_shoes #5 most recent shoes
    order(created_at: :desc).each_slice(5).first
  end

  def self.search(search) #uses instances to search for a shoe by name
   if search
    @shoe = self.all.select{|shoe|
    shoe.title.include?(search.titleize)}

      if shoe
        self.where(title: @shoe.title)
      else
        @shoe = nil
      end
       else
        @shoe = nil
      end
      @shoe
    end
  end
