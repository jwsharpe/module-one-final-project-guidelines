class CreateUsersDrawingTable < ActiveRecord::Migration[5.0]
  def change
    create_table :user_drawings do |t|
      t.string :name
      t.timestamps
    end
  end
end

