class CreateDrawingsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :drawings do |t|
      t.string :title
      t.timestamps
    end
  end
end
