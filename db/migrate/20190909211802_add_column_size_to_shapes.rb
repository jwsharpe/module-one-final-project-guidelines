class AddColumnSizeToShapes < ActiveRecord::Migration[5.0]
  def change
    add_column :shapes, :size, :integer
  end
end
