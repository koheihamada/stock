class RemoveBuyPriceFromSelling < ActiveRecord::Migration[5.0]
  def change
    remove_column :sellings, :buy_price, :integer
    add_column :sellings, :buy_price_id, :integer
  end
end
