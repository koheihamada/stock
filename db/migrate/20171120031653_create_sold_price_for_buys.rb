class CreateSoldPriceForBuys < ActiveRecord::Migration[5.0]
  def change
    create_table :sold_price_for_buys do |t|
      t.integer :sold_price
      t.integer :item_id
      t.integer :selling_id
      t.timestamps
    end
  end
end
