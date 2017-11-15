class AddPaymentIdToSoldPrice < ActiveRecord::Migration[5.0]
  def change
    add_column :sold_prices, :payment_id, :integer
  end
end
