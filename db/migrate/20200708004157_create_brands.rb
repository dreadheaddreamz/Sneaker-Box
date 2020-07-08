class CreateBrands < ActiveRecord::Migration[6.0]
  def change
    create_table :brands do |t|
      t.string :name
      t.boolean :easy_pickup

      t.timestamps
    end
  end
end
