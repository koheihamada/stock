class CreateKinds < ActiveRecord::Migration[5.0]
  def change
    create_table :kinds do |t|
      t.string :name
      t.text :body
      t.integer :category_id
      t.integer :brand_id
      t.timestamps
    end
  end
end
