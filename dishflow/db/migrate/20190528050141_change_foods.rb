class ChangeFoods < ActiveRecord::Migration[6.0]
  def change
    change_column :foods, :menu_id, :integer, :null => true
  end
end
