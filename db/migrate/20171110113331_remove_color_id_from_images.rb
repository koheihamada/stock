class RemoveColorIdFromImages < ActiveRecord::Migration[5.0]
  def change
    remove_column :images, :color_id, :integer
    add_column :images, :item_id, :integer
  end
end
