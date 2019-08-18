class AddMenuIdToDishes < ActiveRecord::Migration[6.0]
  def change
    add_column :dishes, :menu_id, :integer
  end
end
