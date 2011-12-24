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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111218010709) do

  create_table "library_books", :force => true do |t|
    t.string  "title",       :default => "", :null => false
    t.string  "author"
    t.text    "details"
    t.integer "category_id", :default => 0,  :null => false
  end

  add_index "library_books", ["category_id"], :name => "library_books_category_id_fk"

  create_table "library_categories", :force => true do |t|
    t.text "name", :null => false
  end

  create_table "library_copies", :force => true do |t|
    t.integer  "book_id",                    :null => false
    t.string   "index",                      :null => false
    t.string   "publication"
    t.integer  "state",       :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "library_orders", :force => true do |t|
    t.date     "from"
    t.date     "to"
    t.date     "due"
    t.integer  "copy_id"
    t.integer  "user_id"
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "book_id"
  end

  create_table "library_schema_migrations", :id => false, :force => true do |t|
    t.string "version", :null => false
  end

  add_index "library_schema_migrations", ["version"], :name => "library_unique_schema_migrations", :unique => true

  create_table "library_users", :force => true do |t|
    t.string   "email",                                 :default => "",    :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "phone"
    t.boolean  "admin",                                 :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
  end

  add_index "library_users", ["email"], :name => "index_library_users_on_email", :unique => true
  add_index "library_users", ["reset_password_token"], :name => "index_library_users_on_reset_password_token", :unique => true

end
