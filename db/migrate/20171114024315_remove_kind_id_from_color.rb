class RemoveKindIdFromColor < ActiveRecord::Migration[5.0]
  def change
    remove_column :colors, :kind_id, :integer
  end
end
