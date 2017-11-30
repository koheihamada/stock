class RemoveBrandIdFromKind < ActiveRecord::Migration[5.0]
  def change
    remove_column :kinds, :brand_id, :integer
  end
end
