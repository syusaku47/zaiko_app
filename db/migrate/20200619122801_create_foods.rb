class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.string :food
      t.integer :price
      t.date :exp

      t.timestamps
    end
  end
end
