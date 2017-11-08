class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.integer :stock
      t.integer :retail_price
      t.integer :kind_id
      t.integer :color_id
      t.integer :size_id
      t.timestamps
    end
  end
end
