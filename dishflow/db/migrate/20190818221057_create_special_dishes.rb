class CreateSpecialDishes < ActiveRecord::Migration[6.0]
  def change
    create_table :special_dishes do |t|
      t.string :name
      t.text :description
      t.float :price

      t.timestamps
    end
  end
end
