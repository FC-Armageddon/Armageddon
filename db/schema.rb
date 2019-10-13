# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_13_084629) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "arrivals", force: :cascade do |t|
    t.integer "cd_id"
    t.integer "arrival"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cd_id"], name: "index_arrivals_on_cd_id"
  end

  create_table "artists", force: :cascade do |t|
    t.text "artist"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "buy_infomations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "payment_i18n"
    t.integer "delivery_status_i18n"
    t.integer "subtotal"
    t.text "final_postal_code"
    t.text "final_address"
    t.text "final_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_buy_infomations_on_user_id"
  end

  create_table "carts", force: :cascade do |t|
    t.integer "cd_id"
    t.integer "user_id"
    t.integer "quantity"
    t.boolean "deleted_flag", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cd_id"], name: "index_carts_on_cd_id"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "cds", force: :cascade do |t|
    t.integer "genre_id"
    t.integer "label_id"
    t.integer "sales_status_id"
    t.integer "artist_id"
    t.text "cd_name"
    t.text "jacket_image_id"
    t.integer "price"
    t.integer "stock"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "destinations", force: :cascade do |t|
    t.integer "user_id"
    t.text "delivery_postal_code"
    t.text "delivery_address"
    t.text "delivery_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "discs", force: :cascade do |t|
    t.integer "cd_id"
    t.text "disc"
    t.text "sort"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.text "genre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "labels", force: :cascade do |t|
    t.text "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchase_histories", force: :cascade do |t|
    t.integer "buy_informations_id"
    t.text "cd_name"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales_statuses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "sales_status"
  end

  create_table "songs", force: :cascade do |t|
    t.integer "disc_id"
    t.text "song"
    t.integer "song_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["disc_id"], name: "index_songs_on_disc_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.text "postal_code"
    t.text "address"
    t.text "phone_number"
    t.text "profile_image_id"
    t.boolean "deleted_flag", default: false
    t.string "first_name"
    t.string "last_name"
    t.string "kana_first_name"
    t.string "kana_last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
