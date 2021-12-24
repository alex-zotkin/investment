class AddColumnPurchases < ActiveRecord::Migration[6.1]
  def change
    add_column :purchases, :income, :float
  end
end
