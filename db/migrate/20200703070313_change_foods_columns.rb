class ChangeFoodsColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :foods, :food, :string
    add_column :foods, :stock_id, :integer
  end
end
