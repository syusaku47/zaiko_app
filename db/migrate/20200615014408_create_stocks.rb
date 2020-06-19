class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.text :content
      t.integer :stock_number

      t.timestamps
    end
  end
end
