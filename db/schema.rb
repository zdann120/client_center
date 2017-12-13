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

ActiveRecord::Schema.define(version: 20171213015636) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "code", null: false
    t.string "title", null: false
    t.boolean "active", default: true, null: false
    t.integer "default_user_id", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "registration_key"
    t.index ["code"], name: "index_accounts_on_code", unique: true
    t.index ["registration_key"], name: "index_accounts_on_registration_key", unique: true
    t.index ["title"], name: "index_accounts_on_title", unique: true
  end

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "appointments", force: :cascade do |t|
    t.string "token"
    t.string "description"
    t.datetime "starts_at"
    t.integer "duration_minutes"
    t.integer "state"
    t.string "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "attendable_type"
    t.bigint "attendable_id"
    t.index ["attendable_type", "attendable_id"], name: "index_appointments_on_attendable_type_and_attendable_id"
    t.index ["token"], name: "index_appointments_on_token", unique: true
  end

  create_table "contacts", force: :cascade do |t|
    t.string "contactable_type"
    t.bigint "contactable_id"
    t.string "first_name"
    t.string "last_name"
    t.string "business_name"
    t.string "address_line_1"
    t.string "address_line_2"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.string "country"
    t.string "primary_phone"
    t.string "alternate_phone"
    t.string "linking_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contactable_type", "contactable_id"], name: "index_contacts_on_contactable_type_and_contactable_id"
    t.index ["linking_code"], name: "index_contacts_on_linking_code", unique: true
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "documents", force: :cascade do |t|
    t.bigint "account_id"
    t.string "asset"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.index ["account_id"], name: "index_documents_on_account_id"
  end

  create_table "ledger_items", force: :cascade do |t|
    t.bigint "ledger_id"
    t.string "description"
    t.integer "quantity"
    t.string "unit_of_measure"
    t.integer "unit_price_cents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
    t.index ["ledger_id"], name: "index_ledger_items_on_ledger_id"
  end

  create_table "ledgers", force: :cascade do |t|
    t.string "type"
    t.string "reference_code"
    t.bigint "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.index ["account_id"], name: "index_ledgers_on_account_id"
    t.index ["reference_code"], name: "index_ledgers_on_reference_code", unique: true
  end

  create_table "user_accounts", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "account_id"
    t.integer "access_level", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_user_accounts_on_account_id"
    t.index ["user_id"], name: "index_user_accounts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.string "crypted_password"
    t.string "confirmation_token", limit: 128
    t.string "login_token"
    t.datetime "login_token_sent"
    t.string "salt"
    t.integer "role", default: 0, null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["login_token"], name: "index_users_on_login_token", unique: true
  end

  add_foreign_key "documents", "accounts"
  add_foreign_key "ledger_items", "ledgers"
  add_foreign_key "ledgers", "accounts"
  add_foreign_key "user_accounts", "accounts"
  add_foreign_key "user_accounts", "users"
end
