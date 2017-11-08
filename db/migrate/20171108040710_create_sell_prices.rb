class CreateSellPrices < ActiveRecord::Migration[5.0]
  def change
    create_table :sell_prices do |t|
      t.integer :sell_price
      t.integer :user_id
      t.integer :itme_id
      t.timestamps
    end
  end
end
