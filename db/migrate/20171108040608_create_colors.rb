class CreateColors < ActiveRecord::Migration[5.0]
  def change
    create_table :colors do |t|
      t.string :color
      t.integer :kind_id
      t.timestamps
    end
  end
end
