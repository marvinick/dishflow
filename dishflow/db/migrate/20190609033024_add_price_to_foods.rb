class AddPriceToFoods < ActiveRecord::Migration[6.0]
  def change
    add_column :foods, :price, :float
  end
end
