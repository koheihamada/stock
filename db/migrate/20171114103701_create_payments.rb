class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.integer :user_id
      t.integer :item_id
      t.integer :sell_price
      t.integer :my_user_id
      t.timestamps
    end
  end
end
