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

ActiveRecord::Schema.define(version: 2021_06_24_205000) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "credits", force: :cascade do |t|
    t.decimal "amount"
    t.date "credit_at"
    t.string "accept"
    t.bigint "requester_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["requester_id"], name: "index_credits_on_requester_id"
  end

  create_table "loans", force: :cascade do |t|
    t.decimal "amount"
    t.decimal "tax"
    t.integer "term"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "credit_id", null: false
    t.index ["credit_id"], name: "index_loans_on_credit_id"
  end

  create_table "requesters", force: :cascade do |t|
    t.string "name"
    t.text "cnpj"
    t.text "phone"
    t.text "email"
    t.text "commercial_address"
    t.text "company_birth"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "credits", "requesters"
  add_foreign_key "loans", "credits"
end
