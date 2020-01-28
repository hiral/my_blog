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

ActiveRecord::Schema.define(version: 2020_01_17_111530) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.bigint "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_cities_on_name", unique: true
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "text_comments"
    t.bigint "user_id"
    t.bigint "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_countries_on_name", unique: true
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "discription"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.bigint "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_states_on_country_id"
    t.index ["name"], name: "index_states_on_name", unique: true
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name", default: "t"
    t.boolean "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_subjects_on_name", unique: true
  end

  create_table "technologies", force: :cascade do |t|
    t.string "name"
    t.boolean "is_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_technologies_on_name", unique: true
  end

  create_table "technologies_users", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "technology_id"
    t.index ["technology_id"], name: "index_technologies_users_on_technology_id"
    t.index ["user_id", "technology_id"], name: "index_technologies_users_on_user_id_and_technology_id", unique: true
    t.index ["user_id"], name: "index_technologies_users_on_user_id"
  end

  create_table "user_subjects", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_user_subjects_on_subject_id"
    t.index ["user_id", "subject_id"], name: "index_user_subjects_on_user_id_and_subject_id", unique: true
    t.index ["user_id"], name: "index_user_subjects_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.boolean "terms_condition"
    t.string "contact_number"
    t.string "email"
    t.text "parmenent_address"
    t.date "birth_date"
    t.string "aadhar_number"
    t.text "local_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "country_id"
    t.bigint "state_id"
    t.bigint "city_id"
    t.index ["aadhar_number"], name: "index_users_on_aadhar_number", unique: true
    t.index ["city_id"], name: "index_users_on_city_id"
    t.index ["country_id"], name: "index_users_on_country_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["state_id"], name: "index_users_on_state_id"
  end

  add_foreign_key "cities", "states"
  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "posts", "users"
  add_foreign_key "states", "countries"
  add_foreign_key "technologies_users", "technologies"
  add_foreign_key "technologies_users", "users"
  add_foreign_key "user_subjects", "subjects"
  add_foreign_key "user_subjects", "users"
  add_foreign_key "users", "cities"
  add_foreign_key "users", "countries"
  add_foreign_key "users", "states"
end
