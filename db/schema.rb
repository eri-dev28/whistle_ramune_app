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

ActiveRecord::Schema[7.0].define(version: 2023_07_25_085141) do
  create_table "ramunes", force: :cascade do |t|
    t.integer "ramune_normal_girl", default: 0, null: false
    t.integer "ramune_normal_boy", default: 0, null: false
    t.integer "ramune_melon_girl", default: 0, null: false
    t.integer "ramune_melon_boy", default: 0, null: false
    t.integer "ramune_grape_girl", default: 0, null: false
    t.integer "ramune_grape_boy", default: 0, null: false
    t.integer "ramune_yogurt_girl", default: 0, null: false
    t.integer "ramune_yogurt_boy", default: 0, null: false
    t.integer "ramune_strawberry_ver1_girl", default: 0, null: false
    t.integer "ramune_strawberry_ver1_boy", default: 0, null: false
    t.integer "ramune_mixedfruit_girl", default: 0, null: false
    t.integer "ramune_mixedfruit_boy", default: 0, null: false
    t.integer "ramune_orange_girl", default: 0, null: false
    t.integer "ramune_orange_boy", default: 0, null: false
    t.integer "ramune_cola_girl", default: 0, null: false
    t.integer "ramune_cola_boy", default: 0, null: false
    t.integer "ramune_pancake_girl", default: 0, null: false
    t.integer "ramune_pancake_boy", default: 0, null: false
    t.integer "ramune_bluesoda_girl", default: 0, null: false
    t.integer "ramune_bluesoda_boy", default: 0, null: false
    t.integer "ramune_strawberry_ver2_girl", default: 0, null: false
    t.integer "ramune_strawberry_ver2_boy", default: 0, null: false
    t.integer "ramune_pineapplecandy_girl", default: 0, null: false
    t.integer "ramune_pineapplecandy_boy", default: 0, null: false
    t.integer "ramune_mixedjuice_girl", default: 0, null: false
    t.integer "ramune_mixedjuice_boy", default: 0, null: false
    t.integer "ramune_goldencola_girl", default: 0, null: false
    t.integer "ramune_goldencola_boy", default: 0, null: false
    t.integer "ramune_piratecola_girl", default: 0, null: false
    t.integer "ramune_piratecola_boy", default: 0, null: false
    t.integer "ramune_phantomthiefcola_girl", default: 0, null: false
    t.integer "ramune_phantomthiefcola_boy", default: 0, null: false
    t.integer "ramune_cuppyramune_girl", default: 0, null: false
    t.integer "ramune_cuppyramune_boy", default: 0, null: false
    t.integer "ramune_whistlealiencola_girl", default: 0, null: false
    t.integer "ramune_whistlealiencola_boy", default: 0, null: false
    t.integer "ramune_strawberry_ver3_girl", default: 0, null: false
    t.integer "ramune_strawberry_ver3_boy", default: 0, null: false
    t.integer "ramune_parasitecola_girl", default: 0, null: false
    t.integer "ramune_parasitecola_boy", default: 0, null: false
    t.integer "ramune_jumpingbattlecola_girl", default: 0, null: false
    t.integer "ramune_jumpingbattlecola_boy", default: 0, null: false
    t.integer "ramune_inthefuturecola_girl", default: 0, null: false
    t.integer "ramune_inthefuturecola_boy", default: 0, null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "created_at"], name: "index_ramunes_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_ramunes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "ramunes", "users"
end
