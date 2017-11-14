class RemoveSellPriceFromPayment < ActiveRecord::Migration[5.0]
  def change
    remove_column :payments, :sell_price, :integer
    add_column :payments, :sell_price_id, :integer
  end
end
