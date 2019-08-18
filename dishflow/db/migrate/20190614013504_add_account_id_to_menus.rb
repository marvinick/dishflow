class AddAccountIdToMenus < ActiveRecord::Migration[6.0]
  def change
    add_column :menus, :account_id, :integer
  end
end
