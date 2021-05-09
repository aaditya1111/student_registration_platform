ActiveRecord::Schema.define(version: 2021_05_08_180928) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "students", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "mobile"
    t.string "school_name"
    t.integer "standard"
    t.string "address"
    t.integer "roll_no"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email", "mobile"], name: "index_students_on_email_and_mobile", unique: true
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["mobile"], name: "index_students_on_mobile", unique: true
  end

end
