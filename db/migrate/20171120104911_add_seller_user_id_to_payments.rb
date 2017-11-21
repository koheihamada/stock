class AddSellerUserIdToPayments < ActiveRecord::Migration[5.0]
  def change
    add_column :payments, :seller_user_id, :integer
    remove_column :payments, :my_user_id, :integer
  end
end
