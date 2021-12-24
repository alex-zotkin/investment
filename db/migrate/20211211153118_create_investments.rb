class CreateInvestments < ActiveRecord::Migration[6.1]
  def change
    create_table :investments do |t|
      t.string :name, null: false
      t.string :code, null: false
      t.float :rate, null: false
    end
  end
end
