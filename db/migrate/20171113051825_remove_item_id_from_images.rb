class RemoveItemIdFromImages < ActiveRecord::Migration[5.0]
  def change
    remove_column :images, :item_id, :integer
    add_column :images, :kind_id, :integer
  end
end
