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

ActiveRecord::Schema.define(version: 20141219085022) do

  create_table "accounts", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "address"
    t.string   "vat"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "categorizations", force: true do |t|
    t.integer  "product_id"
    t.integer  "subsection_id"
    t.integer  "section_id"
    t.integer  "quantity"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quote_id"
  end

  create_table "copysecs", force: true do |t|
    t.integer  "project_id"
    t.integer  "section_id"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "copysubs", force: true do |t|
    t.integer  "section_id"
    t.integer  "subsection_id"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "favourites", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "section"
    t.string   "subsection"
    t.integer  "product_ids"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "globals", force: true do |t|
    t.integer  "section_id"
    t.string   "name"
    t.string   "section"
    t.string   "subsection"
    t.string   "image"
    t.string   "title"
    t.string   "sku"
    t.string   "quantity"
    t.string   "description"
    t.string   "subdecription"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "installcatagorizations", force: true do |t|
    t.integer  "lineitem_id"
    t.integer  "install_id"
    t.integer  "product_id"
    t.string   "product_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "installs", force: true do |t|
    t.integer  "product_id"
    t.string   "image"
    t.string   "title"
    t.string   "sku"
    t.string   "category"
    t.string   "price"
    t.string   "quantity"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lineitems", force: true do |t|
    t.string   "image"
    t.string   "title"
    t.string   "sku"
    t.string   "catagory"
    t.integer  "price"
    t.string   "description"
    t.string   "subdescription"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity"
    t.boolean  "vatex"
    t.integer  "inclvat"
  end

  create_table "lineitemscatagorizations", force: true do |t|
    t.integer  "lineitem_id"
    t.integer  "subsection_id"
    t.integer  "quantity"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "image"
    t.string   "title"
    t.string   "sku"
    t.string   "catagory"
    t.integer  "price"
    t.string   "description"
    t.string   "subdescription"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.integer  "account_id"
    t.string   "projectName"
    t.string   "version"
    t.string   "documentType"
    t.string   "market"
    t.integer  "randDollar"
    t.integer  "randPound"
    t.string   "address"
    t.string   "contactPerson"
    t.string   "contactNumber"
    t.string   "notes"
    t.integer  "flag"
    t.string   "steps"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sapCode"
    t.integer  "user_id"
  end

  create_table "quotes", force: true do |t|
    t.integer  "project_id"
    t.integer  "section_id"
    t.integer  "subsection_id"
    t.integer  "fav_id"
    t.boolean  "fav"
    t.string   "image"
    t.string   "title"
    t.string   "sku"
    t.string   "category"
    t.string   "manufacturer"
    t.string   "price"
    t.integer  "discount"
    t.string   "description"
    t.string   "subdescription"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", force: true do |t|
    t.integer  "project_id"
    t.string   "name"
    t.string   "description"
    t.string   "misc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections_subs", id: false, force: true do |t|
    t.integer "section_id"
    t.integer "sub_id"
  end

  create_table "subsections", force: true do |t|
    t.integer  "section_id"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trainings", force: true do |t|
    t.integer  "user_id"
    t.integer  "training_mode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.integer  "training_mode"
    t.string   "role"
    t.string   "storeCode"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "versions", force: true do |t|
    t.integer  "account_id"
    t.integer  "project_id"
    t.integer  "user_id"
    t.string   "version"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
