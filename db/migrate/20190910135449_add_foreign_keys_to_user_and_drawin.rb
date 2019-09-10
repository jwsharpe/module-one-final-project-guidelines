class AddForeignKeysToUserAndDrawin < ActiveRecord::Migration[5.0]
  def change
    add_column :user_drawings, :user_id, :integer
    add_column :user_drawings, :drawing_id, :integer
  end
end
