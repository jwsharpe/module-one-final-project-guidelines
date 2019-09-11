class DeleteNameColumnFromUsersDrawings < ActiveRecord::Migration[5.0]
  def change
    remove_column :user_drawings, :name
  end
end
