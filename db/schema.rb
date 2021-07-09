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

ActiveRecord::Schema.define(version: 2021_07_09_180744) do

  create_table "customers", charset: "utf8", force: :cascade do |t|
    t.string "document", limit: 18, null: false
    t.string "full_name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["document"], name: "index_customers_on_document", unique: true
  end

  create_table "loans", charset: "utf8", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.decimal "amount", precision: 14, scale: 2, null: false
    t.decimal "monthly_rate", precision: 9, scale: 4, null: false
    t.integer "months", null: false
    t.decimal "installment", precision: 14, scale: 2, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_loans_on_customer_id"
  end

  add_foreign_key "loans", "customers"
end
