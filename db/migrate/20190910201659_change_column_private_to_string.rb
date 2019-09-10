class ChangeColumnPrivateToString < ActiveRecord::Migration[5.0]
  def change
    change_column :drawings, :private, :string 
  end
end
