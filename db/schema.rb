# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_03_202121) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admin_courses", force: :cascade do |t|
    t.boolean "admin", default: false, null: false
    t.datetime "deleted_at"
    t.bigint "user_id", null: false
    t.bigint "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_admin_courses_on_course_id"
    t.index ["user_id"], name: "index_admin_courses_on_user_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name", limit: 70, null: false
    t.string "description", limit: 250, null: false
    t.string "icon", limit: 55
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "experiences", force: :cascade do |t|
    t.string "name", limit: 80, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "experiences_profiles", id: false, force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.bigint "experience_id", null: false
  end

  create_table "lessons", force: :cascade do |t|
    t.string "icon", limit: 55
    t.string "name", limit: 70, null: false
    t.string "playlist_id"
    t.string "video_id"
    t.datetime "deleted_at"
    t.bigint "period_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "sort_position"
    t.text "description"
    t.index ["period_id"], name: "index_lessons_on_period_id"
  end

  create_table "periods", force: :cascade do |t|
    t.string "name", limit: 70, null: false
    t.integer "order"
    t.string "icon", limit: 55
    t.datetime "deleted_at"
    t.bigint "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "sort_position"
    t.index ["course_id"], name: "index_periods_on_course_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "phone", limit: 20, null: false
    t.string "state_ibge", null: false
    t.string "county_ibge", null: false
    t.string "full_address", limit: 140, null: false
    t.string "zip_code", limit: 20, null: false
    t.string "company_fantasy_name", limit: 60
    t.string "company_legal_name", limit: 70
    t.string "website"
    t.string "gov_id_pf", limit: 25, null: false
    t.string "gov_id_pj", limit: 25
    t.string "description", limit: 70
    t.string "facebook_link"
    t.string "twitter_link"
    t.string "linkedin_link"
    t.string "bio"
    t.string "bank_code", limit: 10
    t.string "bank_agency", limit: 15
    t.string "bank_account", limit: 30
    t.boolean "validated_docs", default: false
    t.datetime "deleted_at"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "birthday"
    t.index ["gov_id_pf"], name: "index_profiles_on_gov_id_pf", unique: true
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", limit: 25, null: false
    t.string "title", limit: 55
    t.string "description", limit: 250
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer "last_lesson"
    t.datetime "deleted_at"
    t.bigint "user_id", null: false
    t.bigint "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_subscriptions_on_course_id"
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name", limit: 70, null: false
    t.string "locale", limit: 5, default: "pt-br", null: false
    t.string "timezone", default: "-03:00", null: false
    t.boolean "admin", default: false, null: false
    t.datetime "deleted_at"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "encrypted_otp_secret"
    t.string "encrypted_otp_secret_iv"
    t.string "encrypted_otp_secret_salt"
    t.integer "consumed_timestep"
    t.boolean "otp_required_for_login"
    t.string "otp_backup_codes", array: true
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "admin_courses", "courses"
  add_foreign_key "admin_courses", "users"
  add_foreign_key "lessons", "periods"
  add_foreign_key "periods", "courses"
  add_foreign_key "profiles", "users"
  add_foreign_key "subscriptions", "courses"
  add_foreign_key "subscriptions", "users"
end
