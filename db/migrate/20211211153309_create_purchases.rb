class CreatePurchases < ActiveRecord::Migration[6.1]
  def change
    create_table :purchases do |t|
      t.belongs_to :investment
      t.belongs_to :user
      t.datetime :date, null: false
      t.integer :quantity, null: false
      t.float :coast, null: false
    end
  end
end
