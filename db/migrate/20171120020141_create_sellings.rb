class CreateSellings < ActiveRecord::Migration[5.0]
  def change
    create_table :sellings do |t|
      t.integer :user_id
      t.integer :item_id
      t.integer :buy_price
      t.integer :my_user_id
      t.integer :sold_price
      t.timestamps
    end
  end
end
