class CreateBuyPrices < ActiveRecord::Migration[5.0]
  def change
    create_table :buy_prices do |t|
      t.integer :buy_price
      t.integer :user_id
      t.integer :item_id
      t.timestamps
    end
  end
end
