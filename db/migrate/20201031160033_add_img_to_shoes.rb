class AddImgToShoes < ActiveRecord::Migration[6.0]
  def change
    add_column :shoes, :image, :string
  end
end
