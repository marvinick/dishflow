class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.references :menu, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.integer :position

      t.timestamps
    end
  end
end
