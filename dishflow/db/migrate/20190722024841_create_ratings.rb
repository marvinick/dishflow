class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.string :name
      t.text :description
      t.belongs_to :menu, null: false, foreign_key: true

      t.timestamps
    end
  end
end
