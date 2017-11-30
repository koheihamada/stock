class RemoveCategoryIdFromKind < ActiveRecord::Migration[5.0]
  def change
    remove_column :kinds, :category_id, :integer
  end
end
