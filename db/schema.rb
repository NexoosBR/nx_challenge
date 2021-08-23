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

ActiveRecord::Schema.define(version: 2021_08_22_222137) do

  create_table "clientes", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "cpf"
    t.integer "telefone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "loans", force: :cascade do |t|
    t.decimal "pmt", precision: 10, scale: 2
    t.decimal "pv", precision: 10, scale: 2
    t.decimal "taxa_mensal", precision: 5, scale: 4
    t.integer "meses"
    t.integer "cliente_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cliente_id"], name: "index_loans_on_cliente_id"
  end

  add_foreign_key "loans", "clientes"
end
