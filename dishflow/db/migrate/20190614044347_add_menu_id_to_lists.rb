class AddMenuIdToLists < ActiveRecord::Migration[6.0]
  def change
    add_column :lists, :menu_id, :integer
  end
end
