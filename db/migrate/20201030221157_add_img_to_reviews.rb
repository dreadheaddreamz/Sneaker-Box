class AddImgToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :image, :string
  end
end
