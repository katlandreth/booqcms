# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20161006215104) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "booqcms_entries", force: :cascade do |t|
    t.string   "post_type"
    t.string   "title"
    t.string   "slug"
    t.text     "payload"
    t.integer  "user_id"
    t.string   "author_name"
    t.datetime "published_at"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "featured_image"
    t.string   "content_format"
    t.integer  "draft_id"
    t.datetime "trashed_at"
  end

  add_index "booqcms_entries", ["post_type"], name: "index_booqcms_entries_on_post_type", using: :btree
  add_index "booqcms_entries", ["slug"], name: "index_booqcms_entries_on_slug", using: :btree
  add_index "booqcms_entries", ["user_id"], name: "index_booqcms_entries_on_user_id", using: :btree

  create_table "booqcms_media", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "file"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "booqcms_taggings", force: :cascade do |t|
    t.integer "tag_id"
    t.integer "entry_id"
  end

  add_index "booqcms_taggings", ["tag_id"], name: "index_booqcms_taggings_on_tag_id", using: :btree

  create_table "booqcms_tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "booqcms_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "booqcms_users", ["email"], name: "index_booqcms_users_on_email", unique: true, using: :btree
  add_index "booqcms_users", ["reset_password_token"], name: "index_booqcms_users_on_reset_password_token", unique: true, using: :btree

  create_table "dashboard_entries", force: :cascade do |t|
    t.string   "post_type"
    t.string   "title"
    t.string   "slug"
    t.text     "payload"
    t.integer  "user_id"
    t.string   "author_name"
    t.datetime "published_at"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "featured_image"
    t.string   "content_format"
    t.integer  "draft_id"
    t.datetime "trashed_at"
  end

  add_index "dashboard_entries", ["post_type"], name: "index_dashboard_entries_on_post_type", using: :btree
  add_index "dashboard_entries", ["slug"], name: "index_dashboard_entries_on_slug", using: :btree
  add_index "dashboard_entries", ["user_id"], name: "index_dashboard_entries_on_user_id", using: :btree

  create_table "dashboard_media", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "file"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "dashboard_taggings", force: :cascade do |t|
    t.integer "tag_id"
    t.integer "entry_id"
  end

  add_index "dashboard_taggings", ["tag_id"], name: "index_dashboard_taggings_on_tag_id", using: :btree

  create_table "dashboard_tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dashboard_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "dashboard_users", ["email"], name: "index_dashboard_users_on_email", unique: true, using: :btree
  add_index "dashboard_users", ["reset_password_token"], name: "index_dashboard_users_on_reset_password_token", unique: true, using: :btree

  create_table "drafts", force: :cascade do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.text     "object"
    t.text     "previous_draft"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.text     "object_changes"
  end

  add_index "drafts", ["created_at"], name: "index_drafts_on_created_at", using: :btree
  add_index "drafts", ["event"], name: "index_drafts_on_event", using: :btree
  add_index "drafts", ["item_id"], name: "index_drafts_on_item_id", using: :btree
  add_index "drafts", ["item_type"], name: "index_drafts_on_item_type", using: :btree
  add_index "drafts", ["updated_at"], name: "index_drafts_on_updated_at", using: :btree
  add_index "drafts", ["whodunnit"], name: "index_drafts_on_whodunnit", using: :btree

  create_table "gimp_versions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "operating_systems", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "os_versions", force: :cascade do |t|
    t.string   "name"
    t.integer  "operating_system_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "os_versions", ["operating_system_id"], name: "index_os_versions_on_operating_system_id", using: :btree

  add_foreign_key "os_versions", "operating_systems"
end
