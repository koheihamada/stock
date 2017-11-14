class RemoveItmeIdFromSellPrice < ActiveRecord::Migration[5.0]
  def change
    remove_column :sell_prices, :itme_id, :integer
    add_column :sell_prices, :item_id, :integer
  end
end
