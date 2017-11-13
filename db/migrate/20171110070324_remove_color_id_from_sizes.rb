class RemoveColorIdFromSizes < ActiveRecord::Migration[5.0]
  def change
    remove_column :sizes, :color_id, :integer
  end
end
