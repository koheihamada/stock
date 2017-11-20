class CreateSoldPriceForSells < ActiveRecord::Migration[5.0]
  def change
    create_table :sold_price_for_sells do |t|
      t.integer :sold_price
      t.integer :item_id
      t.integer :payment_id
      t.timestamps
    end
  end
end
