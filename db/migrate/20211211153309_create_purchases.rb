class CreatePurchases < ActiveRecord::Migration[6.1]
  def change
    create_table :purchases do |t|
      t.belongs_to :invest
      t.belongs_to :user

      t.integer :count, null: false
      t.float :coast, null: false
      t.datetime :date, null: false
    end
  end
end