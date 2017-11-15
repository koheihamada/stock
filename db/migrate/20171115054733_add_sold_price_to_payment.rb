class AddSoldPriceToPayment < ActiveRecord::Migration[5.0]
  def change
    add_column :payments, :sold_payment, :integer
  end
end
