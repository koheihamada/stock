class Records < ActiveRecord::Migration[5.0]
  def change
    drop_table :sold_prices
  end
end
