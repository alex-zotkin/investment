class CreateInvests < ActiveRecord::Migration[6.1]
  def change
    create_table :invests do |t|
      t.string :code, null: false
      t.string :name, null: false
    end
  end
end
