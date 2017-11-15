class RemoveSoldPriceToPayment < ActiveRecord::Migration[5.0]
  def change
    remove_column :payments, :sold_payment, :integer
    add_column :payments, :sold_price, :integer
  end
end
