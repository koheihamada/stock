class CreateSoldPrices < ActiveRecord::Migration[5.0]
  def change
    create_table :sold_prices do |t|
      t.integer :sold_price
      t.integer :item_id
      t.timestamps
    end
  end
end
