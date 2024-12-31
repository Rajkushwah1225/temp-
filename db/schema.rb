ActiveRecord::Schema[7.1].define(version: 2024_11_05_104718) do
  enable_extension "plpgsql"

  create_table "transactions", force: :cascade do |t|
    t.string "transaction_id"
    t.integer "points"
    t.string "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
