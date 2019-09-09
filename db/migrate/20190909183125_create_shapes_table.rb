class CreateShapesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :shapes do |t|
      t.integer :drawing_id
      t.integer :x
      t.integer :y
      t.string :color
      t.timestamps
    end
  end
end
