class AddPrivatePublicAttrToDrawings < ActiveRecord::Migration[5.0]
  def change
    add_column :drawings, :private, :boolean
  end
end
