class AddMenuIdToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :menu_id, :integer
  end
end
