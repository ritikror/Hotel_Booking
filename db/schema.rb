ActiveRecord::Schema[7.0].define(version: 2023_08_25_105538) do
  create_table "bookings", force: :cascade do |t|
    t.string "customer_name"
    t.integer "mobile"
    t.string "room_type"
    t.integer "member"
    t.integer "user_id", null: false
    t.integer "room_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "hotel_id", null: false
    t.index ["hotel_id"], name: "index_bookings_on_hotel_id"
    t.index ["room_id"], name: "index_bookings_on_room_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "hotels", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "contact"
    t.string "status"
    t.integer "location_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_hotels_on_location_id"
    t.index ["user_id"], name: "index_hotels_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "room_number"
    t.string "room_category"
    t.string "status"
    t.integer "occupency"
    t.integer "hotel_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hotel_id"], name: "index_rooms_on_hotel_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "age"
    t.string "password"
    t.integer "mobile"
    t.string "type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bookings", "hotels"
  add_foreign_key "bookings", "rooms"
  add_foreign_key "bookings", "users"
  add_foreign_key "hotels", "locations"
  add_foreign_key "hotels", "users"
  add_foreign_key "rooms", "hotels"
end
