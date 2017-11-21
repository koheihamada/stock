class RemoveMyUserIdFromSelling < ActiveRecord::Migration[5.0]
  def change
    remove_column :sellings, :my_user_id, :integer
    add_column :sellings, :buyer_user_id, :integer
  end
end
