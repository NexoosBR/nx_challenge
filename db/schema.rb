ActiveRecord::Schema.define(version: 2021_09_20_160110) do

  create_table "loans", force: :cascade do |t|
    t.decimal "value"
    t.decimal "taxa"
    t.decimal "pmt", default: "0.0"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
