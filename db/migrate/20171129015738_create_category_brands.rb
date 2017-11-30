class CreateCategoryBrands < ActiveRecord::Migration[5.0]
  def change
    create_table :category_brands do |t|
      t.references :brand
      t.references :category
      t.timestamps
    end
  end
end
