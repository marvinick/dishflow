class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :food_id
      t.text :public
      t.text :private
      t.text :properties

      t.timestamps
    end
  end
end
