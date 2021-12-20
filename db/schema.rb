# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_12_213348) do

  create_table "invests", force: :cascade do |t|
    t.string "code", null: false
    t.string "name", null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.integer "invest_id"
    t.integer "user_id"
    t.integer "count", null: false
    t.float "coast", null: false
    t.datetime "date", null: false
    t.float "income"
    t.index ["invest_id"], name: "index_purchases_on_invest_id"
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "lastname"
    t.string "email"
    t.string "password"
    t.string "img"
  end

end
