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

ActiveRecord::Schema.define(:version => 20111211220311) do

  create_table "ankieta", :force => true do |t|
    t.text    "pyt2",                 :null => false
    t.text    "pyt5",                 :null => false
    t.string  "pyt6",  :limit => 3,   :null => false
    t.text    "pyt7",                 :null => false
    t.string  "pyt8",  :limit => 1,   :null => false
    t.text    "pyt9",                 :null => false
    t.string  "pyt10", :limit => 3,   :null => false
    t.text    "pyt11",                :null => false
    t.string  "pyt12", :limit => 256, :null => false
    t.string  "pyt13", :limit => 3,   :null => false
    t.integer "pyt14",                :null => false
    t.string  "pyt15", :limit => 8,   :null => false
    t.string  "pyt16", :limit => 4,   :null => false
  end

  create_table "jml_advancedtools_menu", :primary_key => "menuid", :force => true do |t|
    t.string  "name",      :limit => 100, :default => "", :null => false
    t.string  "link",                     :default => "", :null => false
    t.string  "class",     :limit => 50,  :default => "", :null => false
    t.string  "csspath",                  :default => "", :null => false
    t.string  "cssfile",   :limit => 20,  :default => "", :null => false
    t.integer "published",                :default => 0,  :null => false
  end

  create_table "jml_banner", :primary_key => "bid", :force => true do |t|
    t.integer  "cid",                             :default => 0,        :null => false
    t.string   "type",             :limit => 30,  :default => "banner", :null => false
    t.string   "name",                            :default => "",       :null => false
    t.string   "alias",                           :default => "",       :null => false
    t.integer  "imptotal",                        :default => 0,        :null => false
    t.integer  "impmade",                         :default => 0,        :null => false
    t.integer  "clicks",                          :default => 0,        :null => false
    t.string   "imageurl",         :limit => 100, :default => "",       :null => false
    t.string   "clickurl",         :limit => 200, :default => "",       :null => false
    t.datetime "date"
    t.boolean  "showBanner",                      :default => false,    :null => false
    t.boolean  "checked_out",                     :default => false,    :null => false
    t.datetime "checked_out_time",                                      :null => false
    t.string   "editor",           :limit => 50
    t.text     "custombannercode"
    t.integer  "catid",                           :default => 0,        :null => false
    t.text     "description",                                           :null => false
    t.boolean  "sticky",                          :default => false,    :null => false
    t.integer  "ordering",                        :default => 0,        :null => false
    t.datetime "publish_up",                                            :null => false
    t.datetime "publish_down",                                          :null => false
    t.text     "tags",                                                  :null => false
    t.text     "params",                                                :null => false
  end

  add_index "jml_banner", ["catid"], :name => "idx_banner_catid"
  add_index "jml_banner", ["showBanner"], :name => "viewbanner"

  create_table "jml_bannerclient", :primary_key => "cid", :force => true do |t|
    t.string  "name",                           :default => "",    :null => false
    t.string  "contact",                        :default => "",    :null => false
    t.string  "email",                          :default => "",    :null => false
    t.text    "extrainfo",                                         :null => false
    t.boolean "checked_out",                    :default => false, :null => false
    t.time    "checked_out_time"
    t.string  "editor",           :limit => 50
  end

  create_table "jml_bannertrack", :id => false, :force => true do |t|
    t.date    "track_date",                :null => false
    t.integer "track_type", :default => 0, :null => false
    t.integer "banner_id",  :default => 0, :null => false
  end

  create_table "jml_categories", :force => true do |t|
    t.integer  "parent_id",                      :default => 0,     :null => false
    t.string   "title",                          :default => "",    :null => false
    t.string   "name",                           :default => "",    :null => false
    t.string   "alias",                          :default => "",    :null => false
    t.string   "image",                          :default => "",    :null => false
    t.string   "section",          :limit => 50, :default => "",    :null => false
    t.string   "image_position",   :limit => 30, :default => "",    :null => false
    t.text     "description",                                       :null => false
    t.boolean  "published",                      :default => false, :null => false
    t.integer  "checked_out",                    :default => 0,     :null => false
    t.datetime "checked_out_time",                                  :null => false
    t.string   "editor",           :limit => 50
    t.integer  "ordering",                       :default => 0,     :null => false
    t.integer  "access",           :limit => 1,  :default => 0,     :null => false
    t.integer  "count",                          :default => 0,     :null => false
    t.text     "params",                                            :null => false
  end

  add_index "jml_categories", ["access"], :name => "idx_access"
  add_index "jml_categories", ["checked_out"], :name => "idx_checkout"
  add_index "jml_categories", ["section", "published", "access"], :name => "cat_idx"

  create_table "jml_components", :force => true do |t|
    t.string  "name",            :limit => 50, :default => "", :null => false
    t.string  "link",                          :default => "", :null => false
    t.integer "menuid",                        :default => 0,  :null => false
    t.integer "parent",                        :default => 0,  :null => false
    t.string  "admin_menu_link",               :default => "", :null => false
    t.string  "admin_menu_alt",                :default => "", :null => false
    t.string  "option",          :limit => 50, :default => "", :null => false
    t.integer "ordering",                      :default => 0,  :null => false
    t.string  "admin_menu_img",                :default => "", :null => false
    t.integer "iscore",          :limit => 1,  :default => 0,  :null => false
    t.text    "params",                                        :null => false
    t.integer "enabled",         :limit => 1,  :default => 1,  :null => false
  end

  add_index "jml_components", ["parent", "option"], :name => "parent_option", :length => {"parent"=>nil, "option"=>32}

  create_table "jml_contact_details", :force => true do |t|
    t.string   "name",                                 :default => "",    :null => false
    t.string   "alias",                                :default => "",    :null => false
    t.string   "con_position"
    t.text     "address"
    t.string   "suburb",           :limit => 100
    t.string   "state",            :limit => 100
    t.string   "country",          :limit => 100
    t.string   "postcode",         :limit => 100
    t.string   "telephone"
    t.string   "fax"
    t.text     "misc",             :limit => 16777215
    t.string   "image"
    t.string   "imagepos",         :limit => 20
    t.string   "email_to"
    t.boolean  "default_con",                          :default => false, :null => false
    t.boolean  "published",                            :default => false, :null => false
    t.integer  "checked_out",                          :default => 0,     :null => false
    t.datetime "checked_out_time",                                        :null => false
    t.integer  "ordering",                             :default => 0,     :null => false
    t.text     "params",                                                  :null => false
    t.integer  "user_id",                              :default => 0,     :null => false
    t.integer  "catid",                                :default => 0,     :null => false
    t.integer  "access",           :limit => 1,        :default => 0,     :null => false
    t.string   "mobile",                               :default => "",    :null => false
    t.string   "webpage",                              :default => "",    :null => false
  end

  add_index "jml_contact_details", ["catid"], :name => "catid"

  create_table "jml_content", :force => true do |t|
    t.string   "title",                                :default => "", :null => false
    t.string   "alias",                                :default => "", :null => false
    t.string   "title_alias",                          :default => "", :null => false
    t.text     "introtext",        :limit => 16777215,                 :null => false
    t.text     "fulltext",         :limit => 16777215,                 :null => false
    t.integer  "state",            :limit => 1,        :default => 0,  :null => false
    t.integer  "sectionid",                            :default => 0,  :null => false
    t.integer  "mask",                                 :default => 0,  :null => false
    t.integer  "catid",                                :default => 0,  :null => false
    t.datetime "created",                                              :null => false
    t.integer  "created_by",                           :default => 0,  :null => false
    t.string   "created_by_alias",                     :default => "", :null => false
    t.datetime "modified",                                             :null => false
    t.integer  "modified_by",                          :default => 0,  :null => false
    t.integer  "checked_out",                          :default => 0,  :null => false
    t.datetime "checked_out_time",                                     :null => false
    t.datetime "publish_up",                                           :null => false
    t.datetime "publish_down",                                         :null => false
    t.text     "images",                                               :null => false
    t.text     "urls",                                                 :null => false
    t.text     "attribs",                                              :null => false
    t.integer  "version",                              :default => 1,  :null => false
    t.integer  "parentid",                             :default => 0,  :null => false
    t.integer  "ordering",                             :default => 0,  :null => false
    t.text     "metakey",                                              :null => false
    t.text     "metadesc",                                             :null => false
    t.integer  "access",                               :default => 0,  :null => false
    t.integer  "hits",                                 :default => 0,  :null => false
    t.text     "metadata",                                             :null => false
  end

  add_index "jml_content", ["access"], :name => "idx_access"
  add_index "jml_content", ["catid"], :name => "idx_catid"
  add_index "jml_content", ["checked_out"], :name => "idx_checkout"
  add_index "jml_content", ["created_by"], :name => "idx_createdby"
  add_index "jml_content", ["sectionid"], :name => "idx_section"
  add_index "jml_content", ["state"], :name => "idx_state"

  create_table "jml_content_frontpage", :primary_key => "content_id", :force => true do |t|
    t.integer "ordering", :default => 0, :null => false
  end

  create_table "jml_content_rating", :primary_key => "content_id", :force => true do |t|
    t.integer "rating_sum",                 :default => 0,  :null => false
    t.integer "rating_count",               :default => 0,  :null => false
    t.string  "lastip",       :limit => 50, :default => "", :null => false
  end

  create_table "jml_core_acl_aro", :force => true do |t|
    t.string  "section_value", :limit => 240, :default => "0", :null => false
    t.string  "value",         :limit => 240, :default => "",  :null => false
    t.integer "order_value",                  :default => 0,   :null => false
    t.string  "name",                         :default => "",  :null => false
    t.integer "hidden",                       :default => 0,   :null => false
  end

  add_index "jml_core_acl_aro", ["hidden"], :name => "jml_gacl_hidden_aro"
  add_index "jml_core_acl_aro", ["section_value", "value"], :name => "jml_section_value_value_aro", :unique => true, :length => {"section_value"=>100, "value"=>100}

  create_table "jml_core_acl_aro_groups", :force => true do |t|
    t.integer "parent_id", :default => 0,  :null => false
    t.string  "name",      :default => "", :null => false
    t.integer "lft",       :default => 0,  :null => false
    t.integer "rgt",       :default => 0,  :null => false
    t.string  "value",     :default => "", :null => false
  end

  add_index "jml_core_acl_aro_groups", ["lft", "rgt"], :name => "jml_gacl_lft_rgt_aro_groups"
  add_index "jml_core_acl_aro_groups", ["parent_id"], :name => "jml_gacl_parent_id_aro_groups"

  create_table "jml_core_acl_aro_map", :id => false, :force => true do |t|
    t.integer "acl_id",                       :default => 0,   :null => false
    t.string  "section_value", :limit => 230, :default => "0", :null => false
    t.string  "value",         :limit => 100, :default => "",  :null => false
  end

  create_table "jml_core_acl_aro_sections", :force => true do |t|
    t.string  "value",       :limit => 230, :default => "", :null => false
    t.integer "order_value",                :default => 0,  :null => false
    t.string  "name",        :limit => 230, :default => "", :null => false
    t.integer "hidden",                     :default => 0,  :null => false
  end

  add_index "jml_core_acl_aro_sections", ["hidden"], :name => "jml_gacl_hidden_aro_sections"
  add_index "jml_core_acl_aro_sections", ["value"], :name => "jml_gacl_value_aro_sections", :unique => true

  create_table "jml_core_acl_groups_aro_map", :id => false, :force => true do |t|
    t.integer "group_id",                     :default => 0,  :null => false
    t.string  "section_value", :limit => 240, :default => "", :null => false
    t.integer "aro_id",                       :default => 0,  :null => false
  end

  add_index "jml_core_acl_groups_aro_map", ["group_id", "section_value", "aro_id"], :name => "group_id_aro_id_groups_aro_map", :unique => true

  create_table "jml_core_log_items", :id => false, :force => true do |t|
    t.date    "time_stamp",                               :null => false
    t.string  "item_table", :limit => 50, :default => "", :null => false
    t.integer "item_id",                  :default => 0,  :null => false
    t.integer "hits",                     :default => 0,  :null => false
  end

  create_table "jml_core_log_searches", :id => false, :force => true do |t|
    t.string  "search_term", :limit => 128, :default => "", :null => false
    t.integer "hits",                       :default => 0,  :null => false
  end

  create_table "jml_gcalendar", :force => true do |t|
    t.string "name",    :limit => 100, :null => false
    t.text   "xmlUrl",                 :null => false
    t.text   "htmlUrl",                :null => false
    t.text   "icalUrl",                :null => false
  end

  create_table "jml_groups", :force => true do |t|
    t.string "name", :limit => 50, :default => "", :null => false
  end

  create_table "jml_jce_extensions", :force => true do |t|
    t.integer "pid",                      :null => false
    t.string  "name",      :limit => 100, :null => false
    t.string  "extension",                :null => false
    t.string  "folder",                   :null => false
    t.integer "published", :limit => 1,   :null => false
  end

  create_table "jml_jce_groups", :force => true do |t|
    t.string   "name",                          :null => false
    t.string   "description",                   :null => false
    t.text     "users",                         :null => false
    t.string   "types",                         :null => false
    t.text     "components",                    :null => false
    t.text     "rows",                          :null => false
    t.string   "plugins",                       :null => false
    t.integer  "published",        :limit => 1, :null => false
    t.integer  "ordering",                      :null => false
    t.integer  "checked_out",      :limit => 1, :null => false
    t.datetime "checked_out_time",              :null => false
    t.text     "params",                        :null => false
  end

  create_table "jml_jce_plugins", :force => true do |t|
    t.string   "title",                         :null => false
    t.string   "name",                          :null => false
    t.string   "type",                          :null => false
    t.string   "icon",                          :null => false
    t.string   "layout",                        :null => false
    t.integer  "row",                           :null => false
    t.integer  "ordering",                      :null => false
    t.integer  "published",        :limit => 1, :null => false
    t.integer  "editable",         :limit => 1, :null => false
    t.string   "elements",                      :null => false
    t.text     "params",                        :null => false
    t.integer  "iscore",           :limit => 1, :null => false
    t.integer  "checked_out",                   :null => false
    t.datetime "checked_out_time",              :null => false
  end

  add_index "jml_jce_plugins", ["name"], :name => "plugin", :unique => true

  create_table "jml_menu", :force => true do |t|
    t.string   "menutype",         :limit => 75
    t.string   "name"
    t.string   "alias",                          :default => "",    :null => false
    t.text     "link"
    t.string   "type",             :limit => 50, :default => "",    :null => false
    t.boolean  "published",                      :default => false, :null => false
    t.integer  "parent",                         :default => 0,     :null => false
    t.integer  "componentid",                    :default => 0,     :null => false
    t.integer  "sublevel",                       :default => 0
    t.integer  "ordering",                       :default => 0
    t.integer  "checked_out",                    :default => 0,     :null => false
    t.datetime "checked_out_time",                                  :null => false
    t.integer  "pollid",                         :default => 0,     :null => false
    t.integer  "browserNav",       :limit => 1,  :default => 0
    t.integer  "access",           :limit => 1,  :default => 0,     :null => false
    t.integer  "utaccess",         :limit => 1,  :default => 0,     :null => false
    t.text     "params",                                            :null => false
    t.integer  "lft",                            :default => 0,     :null => false
    t.integer  "rgt",                            :default => 0,     :null => false
    t.integer  "home",                           :default => 0,     :null => false
  end

  add_index "jml_menu", ["componentid", "menutype", "published", "access"], :name => "componentid"
  add_index "jml_menu", ["menutype"], :name => "menutype"

  create_table "jml_menu_types", :force => true do |t|
    t.string "menutype",    :limit => 75, :default => "", :null => false
    t.string "title",                     :default => "", :null => false
    t.string "description",               :default => "", :null => false
  end

  add_index "jml_menu_types", ["menutype"], :name => "menutype", :unique => true

  create_table "jml_messages", :primary_key => "message_id", :force => true do |t|
    t.integer  "user_id_from", :default => 0, :null => false
    t.integer  "user_id_to",   :default => 0, :null => false
    t.integer  "folder_id",    :default => 0, :null => false
    t.datetime "date_time",                   :null => false
    t.integer  "state",        :default => 0, :null => false
    t.integer  "priority",     :default => 0, :null => false
    t.text     "subject",                     :null => false
    t.text     "message",                     :null => false
  end

  add_index "jml_messages", ["user_id_to", "state"], :name => "useridto_state"

  create_table "jml_messages_cfg", :id => false, :force => true do |t|
    t.integer "user_id",                  :default => 0,  :null => false
    t.string  "cfg_name",  :limit => 100, :default => "", :null => false
    t.string  "cfg_value",                :default => "", :null => false
  end

  add_index "jml_messages_cfg", ["user_id", "cfg_name"], :name => "idx_user_var_name", :unique => true

  create_table "jml_migration_backlinks", :primary_key => "itemid", :force => true do |t|
    t.string "name",   :limit => 100, :default => "", :null => false
    t.text   "url",                                   :null => false
    t.text   "sefurl",                                :null => false
    t.text   "newurl",                                :null => false
  end

  create_table "jml_modules", :force => true do |t|
    t.text     "title",                                             :null => false
    t.text     "content",                                           :null => false
    t.integer  "ordering",                       :default => 0,     :null => false
    t.string   "position",         :limit => 50
    t.integer  "checked_out",                    :default => 0,     :null => false
    t.datetime "checked_out_time",                                  :null => false
    t.boolean  "published",                      :default => false, :null => false
    t.string   "module",           :limit => 50
    t.integer  "numnews",                        :default => 0,     :null => false
    t.integer  "access",           :limit => 1,  :default => 0,     :null => false
    t.integer  "showtitle",        :limit => 1,  :default => 1,     :null => false
    t.text     "params",                                            :null => false
    t.integer  "iscore",           :limit => 1,  :default => 0,     :null => false
    t.integer  "client_id",        :limit => 1,  :default => 0,     :null => false
    t.text     "control",                                           :null => false
  end

  add_index "jml_modules", ["module", "published"], :name => "newsfeeds"
  add_index "jml_modules", ["published", "access"], :name => "published"

  create_table "jml_modules_menu", :id => false, :force => true do |t|
    t.integer "moduleid", :default => 0, :null => false
    t.integer "menuid",   :default => 0, :null => false
  end

  create_table "jml_newsfeeds", :force => true do |t|
    t.integer  "catid",                           :default => 0,     :null => false
    t.text     "name",                                               :null => false
    t.string   "alias",                           :default => "",    :null => false
    t.text     "link",                                               :null => false
    t.string   "filename",         :limit => 200
    t.boolean  "published",                       :default => false, :null => false
    t.integer  "numarticles",                     :default => 1,     :null => false
    t.integer  "cache_time",                      :default => 3600,  :null => false
    t.integer  "checked_out",      :limit => 1,   :default => 0,     :null => false
    t.datetime "checked_out_time",                                   :null => false
    t.integer  "ordering",                        :default => 0,     :null => false
    t.integer  "rtl",              :limit => 1,   :default => 0,     :null => false
  end

  add_index "jml_newsfeeds", ["catid"], :name => "catid"
  add_index "jml_newsfeeds", ["published"], :name => "published"

  create_table "jml_plugins", :force => true do |t|
    t.string   "name",             :limit => 100, :default => "", :null => false
    t.string   "element",          :limit => 100, :default => "", :null => false
    t.string   "folder",           :limit => 100, :default => "", :null => false
    t.integer  "access",           :limit => 1,   :default => 0,  :null => false
    t.integer  "ordering",                        :default => 0,  :null => false
    t.integer  "published",        :limit => 1,   :default => 0,  :null => false
    t.integer  "iscore",           :limit => 1,   :default => 0,  :null => false
    t.integer  "client_id",        :limit => 1,   :default => 0,  :null => false
    t.integer  "checked_out",                     :default => 0,  :null => false
    t.datetime "checked_out_time",                                :null => false
    t.text     "params",                                          :null => false
  end

  add_index "jml_plugins", ["published", "client_id", "access", "folder"], :name => "idx_folder"

  create_table "jml_poll_data", :force => true do |t|
    t.integer "pollid", :default => 0, :null => false
    t.text    "text",                  :null => false
    t.integer "hits",   :default => 0, :null => false
  end

  add_index "jml_poll_data", ["pollid", "text"], :name => "pollid", :length => {"pollid"=>nil, "text"=>1}

  create_table "jml_poll_date", :force => true do |t|
    t.datetime "date",                   :null => false
    t.integer  "vote_id", :default => 0, :null => false
    t.integer  "poll_id", :default => 0, :null => false
  end

  add_index "jml_poll_date", ["poll_id"], :name => "poll_id"

  create_table "jml_poll_menu", :id => false, :force => true do |t|
    t.integer "pollid", :default => 0, :null => false
    t.integer "menuid", :default => 0, :null => false
  end

  create_table "jml_polls", :force => true do |t|
    t.string   "title",            :default => "",    :null => false
    t.string   "alias",            :default => "",    :null => false
    t.integer  "voters",           :default => 0,     :null => false
    t.integer  "checked_out",      :default => 0,     :null => false
    t.datetime "checked_out_time",                    :null => false
    t.boolean  "published",        :default => false, :null => false
    t.integer  "access",           :default => 0,     :null => false
    t.integer  "lag",              :default => 0,     :null => false
  end

  create_table "jml_sections", :force => true do |t|
    t.string   "title",                          :default => "",    :null => false
    t.string   "name",                           :default => "",    :null => false
    t.string   "alias",                          :default => "",    :null => false
    t.text     "image",                                             :null => false
    t.string   "scope",            :limit => 50, :default => "",    :null => false
    t.string   "image_position",   :limit => 30, :default => "",    :null => false
    t.text     "description",                                       :null => false
    t.boolean  "published",                      :default => false, :null => false
    t.integer  "checked_out",                    :default => 0,     :null => false
    t.datetime "checked_out_time",                                  :null => false
    t.integer  "ordering",                       :default => 0,     :null => false
    t.integer  "access",           :limit => 1,  :default => 0,     :null => false
    t.integer  "count",                          :default => 0,     :null => false
    t.text     "params",                                            :null => false
  end

  add_index "jml_sections", ["scope"], :name => "idx_scope"

  create_table "jml_session", :primary_key => "session_id", :force => true do |t|
    t.string  "username",  :limit => 150,        :default => ""
    t.string  "time",      :limit => 14,         :default => ""
    t.integer "guest",     :limit => 1,          :default => 1
    t.integer "userid",                          :default => 0
    t.string  "usertype",  :limit => 50,         :default => ""
    t.integer "gid",       :limit => 1,          :default => 0,  :null => false
    t.integer "client_id", :limit => 1,          :default => 0,  :null => false
    t.text    "data",      :limit => 2147483647
  end

  add_index "jml_session", ["guest", "usertype"], :name => "whosonline"
  add_index "jml_session", ["time"], :name => "time"
  add_index "jml_session", ["userid"], :name => "userid"

  create_table "jml_stats_agents", :id => false, :force => true do |t|
    t.string  "agent", :default => "",    :null => false
    t.boolean "type",  :default => false, :null => false
    t.integer "hits",  :default => 1,     :null => false
  end

  create_table "jml_templates_menu", :id => false, :force => true do |t|
    t.string  "template",               :default => "", :null => false
    t.integer "menuid",                 :default => 0,  :null => false
    t.integer "client_id", :limit => 1, :default => 0,  :null => false
  end

  create_table "jml_users", :force => true do |t|
    t.string   "name",                         :default => "", :null => false
    t.string   "username",      :limit => 150, :default => "", :null => false
    t.string   "email",         :limit => 100, :default => "", :null => false
    t.string   "password",      :limit => 100, :default => "", :null => false
    t.string   "usertype",      :limit => 25,  :default => "", :null => false
    t.integer  "block",         :limit => 1,   :default => 0,  :null => false
    t.integer  "sendEmail",     :limit => 1,   :default => 0
    t.integer  "gid",           :limit => 1,   :default => 1,  :null => false
    t.datetime "registerDate",                                 :null => false
    t.datetime "lastvisitDate",                                :null => false
    t.string   "activation",    :limit => 100, :default => "", :null => false
    t.text     "params",                                       :null => false
  end

  add_index "jml_users", ["email"], :name => "email"
  add_index "jml_users", ["gid", "block"], :name => "gid_block"
  add_index "jml_users", ["name"], :name => "idx_name"
  add_index "jml_users", ["username"], :name => "username"
  add_index "jml_users", ["usertype"], :name => "usertype"

  create_table "jml_weblinks", :force => true do |t|
    t.integer  "catid",                           :default => 0,     :null => false
    t.integer  "sid",                             :default => 0,     :null => false
    t.string   "title",            :limit => 250, :default => "",    :null => false
    t.string   "alias",                           :default => "",    :null => false
    t.string   "url",              :limit => 250, :default => "",    :null => false
    t.text     "description",                                        :null => false
    t.datetime "date",                                               :null => false
    t.integer  "hits",                            :default => 0,     :null => false
    t.boolean  "published",                       :default => false, :null => false
    t.integer  "checked_out",                     :default => 0,     :null => false
    t.datetime "checked_out_time",                                   :null => false
    t.integer  "ordering",                        :default => 0,     :null => false
    t.boolean  "archived",                        :default => false, :null => false
    t.boolean  "approved",                        :default => true,  :null => false
    t.text     "params",                                             :null => false
  end

  add_index "jml_weblinks", ["catid", "published", "archived"], :name => "catid"

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
    t.integer  "book_id",                       :null => false
    t.string   "index",                         :null => false
    t.string   "publication"
    t.boolean  "available",   :default => true, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "library_orders", :force => true do |t|
    t.date     "from"
    t.date     "to"
    t.date     "due"
    t.integer  "copy_id"
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "library_schema_migrations", :id => false, :force => true do |t|
    t.string "version", :null => false
  end

  add_index "library_schema_migrations", ["version"], :name => "library_unique_schema_migrations", :unique => true

  create_table "phpbb3_acl_groups", :id => false, :force => true do |t|
    t.integer "group_id",       :limit => 3, :default => 0, :null => false
    t.integer "forum_id",       :limit => 3, :default => 0, :null => false
    t.integer "auth_option_id", :limit => 3, :default => 0, :null => false
    t.integer "auth_role_id",   :limit => 3, :default => 0, :null => false
    t.integer "auth_setting",   :limit => 1, :default => 0, :null => false
  end

  add_index "phpbb3_acl_groups", ["auth_option_id"], :name => "auth_opt_id"
  add_index "phpbb3_acl_groups", ["auth_role_id"], :name => "auth_role_id"
  add_index "phpbb3_acl_groups", ["group_id"], :name => "group_id"

  create_table "phpbb3_acl_options", :primary_key => "auth_option_id", :force => true do |t|
    t.string  "auth_option",  :limit => 50, :default => "",    :null => false
    t.boolean "is_global",                  :default => false, :null => false
    t.boolean "is_local",                   :default => false, :null => false
    t.boolean "founder_only",               :default => false, :null => false
  end

  add_index "phpbb3_acl_options", ["auth_option"], :name => "auth_option", :unique => true

  create_table "phpbb3_acl_roles", :primary_key => "role_id", :force => true do |t|
    t.string  "role_name",                      :default => "", :null => false
    t.text    "role_description",                               :null => false
    t.string  "role_type",        :limit => 10, :default => "", :null => false
    t.integer "role_order",       :limit => 2,  :default => 0,  :null => false
  end

  add_index "phpbb3_acl_roles", ["role_order"], :name => "role_order"
  add_index "phpbb3_acl_roles", ["role_type"], :name => "role_type"

  create_table "phpbb3_acl_roles_data", :id => false, :force => true do |t|
    t.integer "role_id",        :limit => 3, :default => 0, :null => false
    t.integer "auth_option_id", :limit => 3, :default => 0, :null => false
    t.integer "auth_setting",   :limit => 1, :default => 0, :null => false
  end

  add_index "phpbb3_acl_roles_data", ["auth_option_id"], :name => "ath_op_id"

  create_table "phpbb3_acl_users", :id => false, :force => true do |t|
    t.integer "user_id",        :limit => 3, :default => 0, :null => false
    t.integer "forum_id",       :limit => 3, :default => 0, :null => false
    t.integer "auth_option_id", :limit => 3, :default => 0, :null => false
    t.integer "auth_role_id",   :limit => 3, :default => 0, :null => false
    t.integer "auth_setting",   :limit => 1, :default => 0, :null => false
  end

  add_index "phpbb3_acl_users", ["auth_option_id"], :name => "auth_option_id"
  add_index "phpbb3_acl_users", ["auth_role_id"], :name => "auth_role_id"
  add_index "phpbb3_acl_users", ["user_id"], :name => "user_id"

  create_table "phpbb3_attachments", :primary_key => "attach_id", :force => true do |t|
    t.integer "post_msg_id",       :limit => 3,   :default => 0,     :null => false
    t.integer "topic_id",          :limit => 3,   :default => 0,     :null => false
    t.boolean "in_message",                       :default => false, :null => false
    t.integer "poster_id",         :limit => 3,   :default => 0,     :null => false
    t.boolean "is_orphan",                        :default => true,  :null => false
    t.string  "physical_filename",                :default => "",    :null => false
    t.string  "real_filename",                    :default => "",    :null => false
    t.integer "download_count",    :limit => 3,   :default => 0,     :null => false
    t.text    "attach_comment",                                      :null => false
    t.string  "extension",         :limit => 100, :default => "",    :null => false
    t.string  "mimetype",          :limit => 100, :default => "",    :null => false
    t.integer "filesize",                         :default => 0,     :null => false
    t.integer "filetime",                         :default => 0,     :null => false
    t.boolean "thumbnail",                        :default => false, :null => false
  end

  add_index "phpbb3_attachments", ["filetime"], :name => "filetime"
  add_index "phpbb3_attachments", ["is_orphan"], :name => "is_orphan"
  add_index "phpbb3_attachments", ["post_msg_id"], :name => "post_msg_id"
  add_index "phpbb3_attachments", ["poster_id"], :name => "poster_id"
  add_index "phpbb3_attachments", ["topic_id"], :name => "topic_id"

  create_table "phpbb3_banlist", :primary_key => "ban_id", :force => true do |t|
    t.integer "ban_userid",      :limit => 3,   :default => 0,     :null => false
    t.string  "ban_ip",          :limit => 40,  :default => "",    :null => false
    t.string  "ban_email",       :limit => 100, :default => "",    :null => false
    t.integer "ban_start",                      :default => 0,     :null => false
    t.integer "ban_end",                        :default => 0,     :null => false
    t.boolean "ban_exclude",                    :default => false, :null => false
    t.string  "ban_reason",                     :default => "",    :null => false
    t.string  "ban_give_reason",                :default => "",    :null => false
  end

  add_index "phpbb3_banlist", ["ban_email", "ban_exclude"], :name => "ban_email"
  add_index "phpbb3_banlist", ["ban_end"], :name => "ban_end"
  add_index "phpbb3_banlist", ["ban_ip", "ban_exclude"], :name => "ban_ip"
  add_index "phpbb3_banlist", ["ban_userid", "ban_exclude"], :name => "ban_user"

  create_table "phpbb3_bbcodes", :primary_key => "bbcode_id", :force => true do |t|
    t.string  "bbcode_tag",          :limit => 16,       :default => "",    :null => false
    t.string  "bbcode_helpline",                         :default => "",    :null => false
    t.boolean "display_on_posting",                      :default => false, :null => false
    t.text    "bbcode_match",                                               :null => false
    t.text    "bbcode_tpl",          :limit => 16777215,                    :null => false
    t.text    "first_pass_match",    :limit => 16777215,                    :null => false
    t.text    "first_pass_replace",  :limit => 16777215,                    :null => false
    t.text    "second_pass_match",   :limit => 16777215,                    :null => false
    t.text    "second_pass_replace", :limit => 16777215,                    :null => false
  end

  add_index "phpbb3_bbcodes", ["display_on_posting"], :name => "display_on_post"

  create_table "phpbb3_bookmarks", :id => false, :force => true do |t|
    t.integer "topic_id", :limit => 3, :default => 0, :null => false
    t.integer "user_id",  :limit => 3, :default => 0, :null => false
  end

  create_table "phpbb3_bots", :primary_key => "bot_id", :force => true do |t|
    t.boolean "bot_active",              :default => true, :null => false
    t.string  "bot_name",                :default => "",   :null => false
    t.integer "user_id",    :limit => 3, :default => 0,    :null => false
    t.string  "bot_agent",               :default => "",   :null => false
    t.string  "bot_ip",                  :default => "",   :null => false
  end

  add_index "phpbb3_bots", ["bot_active"], :name => "bot_active"

  create_table "phpbb3_captcha_answers", :id => false, :force => true do |t|
    t.integer "question_id", :limit => 3, :default => 0,  :null => false
    t.string  "answer_text",              :default => "", :null => false
  end

  add_index "phpbb3_captcha_answers", ["question_id"], :name => "question_id"

  create_table "phpbb3_captcha_questions", :primary_key => "question_id", :force => true do |t|
    t.boolean "strict",                      :default => false, :null => false
    t.integer "lang_id",       :limit => 3,  :default => 0,     :null => false
    t.string  "lang_iso",      :limit => 30, :default => "",    :null => false
    t.text    "question_text",                                  :null => false
  end

  add_index "phpbb3_captcha_questions", ["lang_iso"], :name => "lang_iso"

  create_table "phpbb3_config", :primary_key => "config_name", :force => true do |t|
    t.string  "config_value", :default => "",    :null => false
    t.boolean "is_dynamic",   :default => false, :null => false
  end

  add_index "phpbb3_config", ["is_dynamic"], :name => "is_dynamic"

  create_table "phpbb3_confirm", :id => false, :force => true do |t|
    t.string  "confirm_id",   :limit => 32, :default => "", :null => false
    t.string  "session_id",   :limit => 32, :default => "", :null => false
    t.integer "confirm_type", :limit => 1,  :default => 0,  :null => false
    t.string  "code",         :limit => 8,  :default => "", :null => false
    t.integer "seed",                       :default => 0,  :null => false
    t.integer "attempts",     :limit => 3,  :default => 0,  :null => false
  end

  add_index "phpbb3_confirm", ["confirm_type"], :name => "confirm_type"

  create_table "phpbb3_disallow", :primary_key => "disallow_id", :force => true do |t|
    t.string "disallow_username", :default => "", :null => false
  end

  create_table "phpbb3_drafts", :primary_key => "draft_id", :force => true do |t|
    t.integer "user_id",       :limit => 3,        :default => 0,  :null => false
    t.integer "topic_id",      :limit => 3,        :default => 0,  :null => false
    t.integer "forum_id",      :limit => 3,        :default => 0,  :null => false
    t.integer "save_time",                         :default => 0,  :null => false
    t.string  "draft_subject",                     :default => "", :null => false
    t.text    "draft_message", :limit => 16777215,                 :null => false
  end

  add_index "phpbb3_drafts", ["save_time"], :name => "save_time"

  create_table "phpbb3_extension_groups", :primary_key => "group_id", :force => true do |t|
    t.string  "group_name",                  :default => "",    :null => false
    t.integer "cat_id",         :limit => 1, :default => 0,     :null => false
    t.boolean "allow_group",                 :default => false, :null => false
    t.boolean "download_mode",               :default => true,  :null => false
    t.string  "upload_icon",                 :default => "",    :null => false
    t.integer "max_filesize",                :default => 0,     :null => false
    t.text    "allowed_forums",                                 :null => false
    t.boolean "allow_in_pm",                 :default => false, :null => false
  end

  create_table "phpbb3_extensions", :primary_key => "extension_id", :force => true do |t|
    t.integer "group_id",  :limit => 3,   :default => 0,  :null => false
    t.string  "extension", :limit => 100, :default => "", :null => false
  end

  create_table "phpbb3_forums", :primary_key => "forum_id", :force => true do |t|
    t.integer "parent_id",                :limit => 3,        :default => 0,     :null => false
    t.integer "left_id",                  :limit => 3,        :default => 0,     :null => false
    t.integer "right_id",                 :limit => 3,        :default => 0,     :null => false
    t.text    "forum_parents",            :limit => 16777215,                    :null => false
    t.string  "forum_name",                                   :default => "",    :null => false
    t.text    "forum_desc",                                                      :null => false
    t.string  "forum_desc_bitfield",                          :default => "",    :null => false
    t.integer "forum_desc_options",                           :default => 7,     :null => false
    t.string  "forum_desc_uid",           :limit => 8,        :default => "",    :null => false
    t.string  "forum_link",                                   :default => "",    :null => false
    t.string  "forum_password",           :limit => 40,       :default => "",    :null => false
    t.integer "forum_style",              :limit => 3,        :default => 0,     :null => false
    t.string  "forum_image",                                  :default => "",    :null => false
    t.text    "forum_rules",                                                     :null => false
    t.string  "forum_rules_link",                             :default => "",    :null => false
    t.string  "forum_rules_bitfield",                         :default => "",    :null => false
    t.integer "forum_rules_options",                          :default => 7,     :null => false
    t.string  "forum_rules_uid",          :limit => 8,        :default => "",    :null => false
    t.integer "forum_topics_per_page",    :limit => 1,        :default => 0,     :null => false
    t.integer "forum_type",               :limit => 1,        :default => 0,     :null => false
    t.integer "forum_status",             :limit => 1,        :default => 0,     :null => false
    t.integer "forum_posts",              :limit => 3,        :default => 0,     :null => false
    t.integer "forum_topics",             :limit => 3,        :default => 0,     :null => false
    t.integer "forum_topics_real",        :limit => 3,        :default => 0,     :null => false
    t.integer "forum_last_post_id",       :limit => 3,        :default => 0,     :null => false
    t.integer "forum_last_poster_id",     :limit => 3,        :default => 0,     :null => false
    t.string  "forum_last_post_subject",                      :default => "",    :null => false
    t.integer "forum_last_post_time",                         :default => 0,     :null => false
    t.string  "forum_last_poster_name",                       :default => "",    :null => false
    t.string  "forum_last_poster_colour", :limit => 6,        :default => "",    :null => false
    t.integer "forum_flags",              :limit => 1,        :default => 32,    :null => false
    t.boolean "display_subforum_list",                        :default => true,  :null => false
    t.boolean "display_on_index",                             :default => true,  :null => false
    t.boolean "enable_indexing",                              :default => true,  :null => false
    t.boolean "enable_icons",                                 :default => true,  :null => false
    t.boolean "enable_prune",                                 :default => false, :null => false
    t.integer "prune_next",                                   :default => 0,     :null => false
    t.integer "prune_days",               :limit => 3,        :default => 0,     :null => false
    t.integer "prune_viewed",             :limit => 3,        :default => 0,     :null => false
    t.integer "prune_freq",               :limit => 3,        :default => 0,     :null => false
    t.integer "forum_options",                                :default => 0,     :null => false
  end

  add_index "phpbb3_forums", ["forum_last_post_id"], :name => "forum_lastpost_id"
  add_index "phpbb3_forums", ["left_id", "right_id"], :name => "left_right_id"

  create_table "phpbb3_forums_access", :id => false, :force => true do |t|
    t.integer "forum_id",   :limit => 3,  :default => 0,  :null => false
    t.integer "user_id",    :limit => 3,  :default => 0,  :null => false
    t.string  "session_id", :limit => 32, :default => "", :null => false
  end

  create_table "phpbb3_forums_track", :id => false, :force => true do |t|
    t.integer "user_id",   :limit => 3, :default => 0, :null => false
    t.integer "forum_id",  :limit => 3, :default => 0, :null => false
    t.integer "mark_time",              :default => 0, :null => false
  end

  create_table "phpbb3_forums_watch", :id => false, :force => true do |t|
    t.integer "forum_id",      :limit => 3, :default => 0,     :null => false
    t.integer "user_id",       :limit => 3, :default => 0,     :null => false
    t.boolean "notify_status",              :default => false, :null => false
  end

  add_index "phpbb3_forums_watch", ["forum_id"], :name => "forum_id"
  add_index "phpbb3_forums_watch", ["notify_status"], :name => "notify_stat"
  add_index "phpbb3_forums_watch", ["user_id"], :name => "user_id"

  create_table "phpbb3_groups", :primary_key => "group_id", :force => true do |t|
    t.integer "group_type",           :limit => 1, :default => 1,     :null => false
    t.boolean "group_founder_manage",              :default => false, :null => false
    t.string  "group_name",                        :default => "",    :null => false
    t.text    "group_desc",                                           :null => false
    t.string  "group_desc_bitfield",               :default => "",    :null => false
    t.integer "group_desc_options",                :default => 7,     :null => false
    t.string  "group_desc_uid",       :limit => 8, :default => "",    :null => false
    t.boolean "group_display",                     :default => false, :null => false
    t.string  "group_avatar",                      :default => "",    :null => false
    t.integer "group_avatar_type",    :limit => 1, :default => 0,     :null => false
    t.integer "group_avatar_width",   :limit => 2, :default => 0,     :null => false
    t.integer "group_avatar_height",  :limit => 2, :default => 0,     :null => false
    t.integer "group_rank",           :limit => 3, :default => 0,     :null => false
    t.string  "group_colour",         :limit => 6, :default => "",    :null => false
    t.integer "group_sig_chars",      :limit => 3, :default => 0,     :null => false
    t.boolean "group_receive_pm",                  :default => false, :null => false
    t.integer "group_message_limit",  :limit => 3, :default => 0,     :null => false
    t.boolean "group_legend",                      :default => true,  :null => false
    t.integer "group_max_recipients", :limit => 3, :default => 0,     :null => false
    t.boolean "group_skip_auth",                   :default => false, :null => false
  end

  add_index "phpbb3_groups", ["group_legend", "group_name"], :name => "group_legend_name"

  create_table "phpbb3_icons", :primary_key => "icons_id", :force => true do |t|
    t.string  "icons_url",                       :default => "",   :null => false
    t.integer "icons_width",        :limit => 1, :default => 0,    :null => false
    t.integer "icons_height",       :limit => 1, :default => 0,    :null => false
    t.integer "icons_order",        :limit => 3, :default => 0,    :null => false
    t.boolean "display_on_posting",              :default => true, :null => false
  end

  add_index "phpbb3_icons", ["display_on_posting"], :name => "display_on_posting"

  create_table "phpbb3_lang", :primary_key => "lang_id", :force => true do |t|
    t.string "lang_iso",          :limit => 30,  :default => "", :null => false
    t.string "lang_dir",          :limit => 30,  :default => "", :null => false
    t.string "lang_english_name", :limit => 100, :default => "", :null => false
    t.string "lang_local_name",                  :default => "", :null => false
    t.string "lang_author",                      :default => "", :null => false
  end

  add_index "phpbb3_lang", ["lang_iso"], :name => "lang_iso"

  create_table "phpbb3_log", :primary_key => "log_id", :force => true do |t|
    t.integer "log_type",      :limit => 1,        :default => 0,  :null => false
    t.integer "user_id",       :limit => 3,        :default => 0,  :null => false
    t.integer "forum_id",      :limit => 3,        :default => 0,  :null => false
    t.integer "topic_id",      :limit => 3,        :default => 0,  :null => false
    t.integer "reportee_id",   :limit => 3,        :default => 0,  :null => false
    t.string  "log_ip",        :limit => 40,       :default => "", :null => false
    t.integer "log_time",                          :default => 0,  :null => false
    t.text    "log_operation",                                     :null => false
    t.text    "log_data",      :limit => 16777215,                 :null => false
  end

  add_index "phpbb3_log", ["forum_id"], :name => "forum_id"
  add_index "phpbb3_log", ["log_type"], :name => "log_type"
  add_index "phpbb3_log", ["reportee_id"], :name => "reportee_id"
  add_index "phpbb3_log", ["topic_id"], :name => "topic_id"
  add_index "phpbb3_log", ["user_id"], :name => "user_id"

  create_table "phpbb3_moderator_cache", :id => false, :force => true do |t|
    t.integer "forum_id",         :limit => 3, :default => 0,    :null => false
    t.integer "user_id",          :limit => 3, :default => 0,    :null => false
    t.string  "username",                      :default => "",   :null => false
    t.integer "group_id",         :limit => 3, :default => 0,    :null => false
    t.string  "group_name",                    :default => "",   :null => false
    t.boolean "display_on_index",              :default => true, :null => false
  end

  add_index "phpbb3_moderator_cache", ["display_on_index"], :name => "disp_idx"
  add_index "phpbb3_moderator_cache", ["forum_id"], :name => "forum_id"

  create_table "phpbb3_modules", :primary_key => "module_id", :force => true do |t|
    t.boolean "module_enabled",                :default => true, :null => false
    t.boolean "module_display",                :default => true, :null => false
    t.string  "module_basename",               :default => "",   :null => false
    t.string  "module_class",    :limit => 10, :default => "",   :null => false
    t.integer "parent_id",       :limit => 3,  :default => 0,    :null => false
    t.integer "left_id",         :limit => 3,  :default => 0,    :null => false
    t.integer "right_id",        :limit => 3,  :default => 0,    :null => false
    t.string  "module_langname",               :default => "",   :null => false
    t.string  "module_mode",                   :default => "",   :null => false
    t.string  "module_auth",                   :default => "",   :null => false
  end

  add_index "phpbb3_modules", ["left_id", "right_id"], :name => "left_right_id"
  add_index "phpbb3_modules", ["module_class", "left_id"], :name => "class_left_id"
  add_index "phpbb3_modules", ["module_enabled"], :name => "module_enabled"

  create_table "phpbb3_poll_options", :id => false, :force => true do |t|
    t.integer "poll_option_id",    :limit => 1, :default => 0, :null => false
    t.integer "topic_id",          :limit => 3, :default => 0, :null => false
    t.text    "poll_option_text",                              :null => false
    t.integer "poll_option_total", :limit => 3, :default => 0, :null => false
  end

  add_index "phpbb3_poll_options", ["poll_option_id"], :name => "poll_opt_id"
  add_index "phpbb3_poll_options", ["topic_id"], :name => "topic_id"

  create_table "phpbb3_poll_votes", :id => false, :force => true do |t|
    t.integer "topic_id",       :limit => 3,  :default => 0,  :null => false
    t.integer "poll_option_id", :limit => 1,  :default => 0,  :null => false
    t.integer "vote_user_id",   :limit => 3,  :default => 0,  :null => false
    t.string  "vote_user_ip",   :limit => 40, :default => "", :null => false
  end

  add_index "phpbb3_poll_votes", ["topic_id"], :name => "topic_id"
  add_index "phpbb3_poll_votes", ["vote_user_id"], :name => "vote_user_id"
  add_index "phpbb3_poll_votes", ["vote_user_ip"], :name => "vote_user_ip"

  create_table "phpbb3_posts", :primary_key => "post_id", :force => true do |t|
    t.integer "topic_id",         :limit => 3,        :default => 0,     :null => false
    t.integer "forum_id",         :limit => 3,        :default => 0,     :null => false
    t.integer "poster_id",        :limit => 3,        :default => 0,     :null => false
    t.integer "icon_id",          :limit => 3,        :default => 0,     :null => false
    t.string  "poster_ip",        :limit => 40,       :default => "",    :null => false
    t.integer "post_time",                            :default => 0,     :null => false
    t.boolean "post_approved",                        :default => true,  :null => false
    t.boolean "post_reported",                        :default => false, :null => false
    t.boolean "enable_bbcode",                        :default => true,  :null => false
    t.boolean "enable_smilies",                       :default => true,  :null => false
    t.boolean "enable_magic_url",                     :default => true,  :null => false
    t.boolean "enable_sig",                           :default => true,  :null => false
    t.string  "post_username",                        :default => "",    :null => false
    t.string  "post_subject",                         :default => "",    :null => false
    t.text    "post_text",        :limit => 16777215,                    :null => false
    t.string  "post_checksum",    :limit => 32,       :default => "",    :null => false
    t.boolean "post_attachment",                      :default => false, :null => false
    t.string  "bbcode_bitfield",                      :default => "",    :null => false
    t.string  "bbcode_uid",       :limit => 8,        :default => "",    :null => false
    t.boolean "post_postcount",                       :default => true,  :null => false
    t.integer "post_edit_time",                       :default => 0,     :null => false
    t.string  "post_edit_reason",                     :default => "",    :null => false
    t.integer "post_edit_user",   :limit => 3,        :default => 0,     :null => false
    t.integer "post_edit_count",  :limit => 2,        :default => 0,     :null => false
    t.boolean "post_edit_locked",                     :default => false, :null => false
  end

  add_index "phpbb3_posts", ["forum_id"], :name => "forum_id"
  add_index "phpbb3_posts", ["post_approved"], :name => "post_approved"
  add_index "phpbb3_posts", ["post_subject", "post_text"], :name => "post_content"
  add_index "phpbb3_posts", ["post_subject"], :name => "post_subject"
  add_index "phpbb3_posts", ["post_text"], :name => "post_text"
  add_index "phpbb3_posts", ["post_username"], :name => "post_username"
  add_index "phpbb3_posts", ["poster_id"], :name => "poster_id"
  add_index "phpbb3_posts", ["poster_ip"], :name => "poster_ip"
  add_index "phpbb3_posts", ["topic_id", "post_time"], :name => "tid_post_time"
  add_index "phpbb3_posts", ["topic_id"], :name => "topic_id"

  create_table "phpbb3_privmsgs", :primary_key => "msg_id", :force => true do |t|
    t.integer "root_level",          :limit => 3,        :default => 0,     :null => false
    t.integer "author_id",           :limit => 3,        :default => 0,     :null => false
    t.integer "icon_id",             :limit => 3,        :default => 0,     :null => false
    t.string  "author_ip",           :limit => 40,       :default => "",    :null => false
    t.integer "message_time",                            :default => 0,     :null => false
    t.boolean "enable_bbcode",                           :default => true,  :null => false
    t.boolean "enable_smilies",                          :default => true,  :null => false
    t.boolean "enable_magic_url",                        :default => true,  :null => false
    t.boolean "enable_sig",                              :default => true,  :null => false
    t.string  "message_subject",                         :default => "",    :null => false
    t.text    "message_text",        :limit => 16777215,                    :null => false
    t.string  "message_edit_reason",                     :default => "",    :null => false
    t.integer "message_edit_user",   :limit => 3,        :default => 0,     :null => false
    t.boolean "message_attachment",                      :default => false, :null => false
    t.string  "bbcode_bitfield",                         :default => "",    :null => false
    t.string  "bbcode_uid",          :limit => 8,        :default => "",    :null => false
    t.integer "message_edit_time",                       :default => 0,     :null => false
    t.integer "message_edit_count",  :limit => 2,        :default => 0,     :null => false
    t.text    "to_address",                                                 :null => false
    t.text    "bcc_address",                                                :null => false
    t.boolean "message_reported",                        :default => false, :null => false
  end

  add_index "phpbb3_privmsgs", ["author_id"], :name => "author_id"
  add_index "phpbb3_privmsgs", ["author_ip"], :name => "author_ip"
  add_index "phpbb3_privmsgs", ["message_time"], :name => "message_time"
  add_index "phpbb3_privmsgs", ["root_level"], :name => "root_level"

  create_table "phpbb3_privmsgs_folder", :primary_key => "folder_id", :force => true do |t|
    t.integer "user_id",     :limit => 3, :default => 0,  :null => false
    t.string  "folder_name",              :default => "", :null => false
    t.integer "pm_count",    :limit => 3, :default => 0,  :null => false
  end

  add_index "phpbb3_privmsgs_folder", ["user_id"], :name => "user_id"

  create_table "phpbb3_privmsgs_rules", :primary_key => "rule_id", :force => true do |t|
    t.integer "user_id",         :limit => 3, :default => 0,  :null => false
    t.integer "rule_check",      :limit => 3, :default => 0,  :null => false
    t.integer "rule_connection", :limit => 3, :default => 0,  :null => false
    t.string  "rule_string",                  :default => "", :null => false
    t.integer "rule_user_id",    :limit => 3, :default => 0,  :null => false
    t.integer "rule_group_id",   :limit => 3, :default => 0,  :null => false
    t.integer "rule_action",     :limit => 3, :default => 0,  :null => false
    t.integer "rule_folder_id",               :default => 0,  :null => false
  end

  add_index "phpbb3_privmsgs_rules", ["user_id"], :name => "user_id"

  create_table "phpbb3_privmsgs_to", :id => false, :force => true do |t|
    t.integer "msg_id",       :limit => 3, :default => 0,     :null => false
    t.integer "user_id",      :limit => 3, :default => 0,     :null => false
    t.integer "author_id",    :limit => 3, :default => 0,     :null => false
    t.boolean "pm_deleted",                :default => false, :null => false
    t.boolean "pm_new",                    :default => true,  :null => false
    t.boolean "pm_unread",                 :default => true,  :null => false
    t.boolean "pm_replied",                :default => false, :null => false
    t.boolean "pm_marked",                 :default => false, :null => false
    t.boolean "pm_forwarded",              :default => false, :null => false
    t.integer "folder_id",                 :default => 0,     :null => false
  end

  add_index "phpbb3_privmsgs_to", ["author_id"], :name => "author_id"
  add_index "phpbb3_privmsgs_to", ["msg_id"], :name => "msg_id"
  add_index "phpbb3_privmsgs_to", ["user_id", "folder_id"], :name => "usr_flder_id"

  create_table "phpbb3_profile_fields", :primary_key => "field_id", :force => true do |t|
    t.string  "field_name",                        :default => "",    :null => false
    t.integer "field_type",          :limit => 1,  :default => 0,     :null => false
    t.string  "field_ident",         :limit => 20, :default => "",    :null => false
    t.string  "field_length",        :limit => 20, :default => "",    :null => false
    t.string  "field_minlen",                      :default => "",    :null => false
    t.string  "field_maxlen",                      :default => "",    :null => false
    t.string  "field_novalue",                     :default => "",    :null => false
    t.string  "field_default_value",               :default => "",    :null => false
    t.string  "field_validation",    :limit => 20, :default => "",    :null => false
    t.boolean "field_required",                    :default => false, :null => false
    t.boolean "field_show_on_reg",                 :default => false, :null => false
    t.boolean "field_hide",                        :default => false, :null => false
    t.boolean "field_no_view",                     :default => false, :null => false
    t.boolean "field_active",                      :default => false, :null => false
    t.integer "field_order",         :limit => 3,  :default => 0,     :null => false
    t.boolean "field_show_profile",                :default => false, :null => false
    t.boolean "field_show_on_vt",                  :default => false, :null => false
  end

  add_index "phpbb3_profile_fields", ["field_order"], :name => "fld_ordr"
  add_index "phpbb3_profile_fields", ["field_type"], :name => "fld_type"

  create_table "phpbb3_profile_fields_data", :primary_key => "user_id", :force => true do |t|
  end

  create_table "phpbb3_profile_fields_lang", :id => false, :force => true do |t|
    t.integer "field_id",   :limit => 3, :default => 0,  :null => false
    t.integer "lang_id",    :limit => 3, :default => 0,  :null => false
    t.integer "option_id",  :limit => 3, :default => 0,  :null => false
    t.integer "field_type", :limit => 1, :default => 0,  :null => false
    t.string  "lang_value",              :default => "", :null => false
  end

  create_table "phpbb3_profile_lang", :id => false, :force => true do |t|
    t.integer "field_id",           :limit => 3, :default => 0,  :null => false
    t.integer "lang_id",            :limit => 3, :default => 0,  :null => false
    t.string  "lang_name",                       :default => "", :null => false
    t.text    "lang_explain",                                    :null => false
    t.string  "lang_default_value",              :default => "", :null => false
  end

  create_table "phpbb3_qa_confirm", :primary_key => "confirm_id", :force => true do |t|
    t.string  "session_id",   :limit => 32, :default => "", :null => false
    t.string  "lang_iso",     :limit => 30, :default => "", :null => false
    t.integer "question_id",  :limit => 3,  :default => 0,  :null => false
    t.integer "attempts",     :limit => 3,  :default => 0,  :null => false
    t.integer "confirm_type", :limit => 2,  :default => 0,  :null => false
  end

  add_index "phpbb3_qa_confirm", ["confirm_id", "session_id", "lang_iso"], :name => "lookup"
  add_index "phpbb3_qa_confirm", ["session_id"], :name => "session_id"

  create_table "phpbb3_ranks", :primary_key => "rank_id", :force => true do |t|
    t.string  "rank_title",                :default => "",    :null => false
    t.integer "rank_min",     :limit => 3, :default => 0,     :null => false
    t.boolean "rank_special",              :default => false, :null => false
    t.string  "rank_image",                :default => "",    :null => false
  end

  create_table "phpbb3_reports", :primary_key => "report_id", :force => true do |t|
    t.integer "reason_id",     :limit => 2,        :default => 0,     :null => false
    t.integer "post_id",       :limit => 3,        :default => 0,     :null => false
    t.integer "user_id",       :limit => 3,        :default => 0,     :null => false
    t.boolean "user_notify",                       :default => false, :null => false
    t.boolean "report_closed",                     :default => false, :null => false
    t.integer "report_time",                       :default => 0,     :null => false
    t.text    "report_text",   :limit => 16777215,                    :null => false
    t.integer "pm_id",         :limit => 3,        :default => 0,     :null => false
  end

  add_index "phpbb3_reports", ["pm_id"], :name => "pm_id"
  add_index "phpbb3_reports", ["post_id"], :name => "post_id"

  create_table "phpbb3_reports_reasons", :primary_key => "reason_id", :force => true do |t|
    t.string  "reason_title",                           :default => "", :null => false
    t.text    "reason_description", :limit => 16777215,                 :null => false
    t.integer "reason_order",       :limit => 2,        :default => 0,  :null => false
  end

  create_table "phpbb3_search_results", :primary_key => "search_key", :force => true do |t|
    t.integer "search_time",                         :default => 0, :null => false
    t.text    "search_keywords", :limit => 16777215,                :null => false
    t.text    "search_authors",  :limit => 16777215,                :null => false
  end

  create_table "phpbb3_search_wordlist", :primary_key => "word_id", :force => true do |t|
    t.string  "word_text",                :default => "",    :null => false
    t.boolean "word_common",              :default => false, :null => false
    t.integer "word_count",  :limit => 3, :default => 0,     :null => false
  end

  add_index "phpbb3_search_wordlist", ["word_count"], :name => "wrd_cnt"
  add_index "phpbb3_search_wordlist", ["word_text"], :name => "wrd_txt", :unique => true

  create_table "phpbb3_search_wordmatch", :id => false, :force => true do |t|
    t.integer "post_id",     :limit => 3, :default => 0,     :null => false
    t.integer "word_id",     :limit => 3, :default => 0,     :null => false
    t.boolean "title_match",              :default => false, :null => false
  end

  add_index "phpbb3_search_wordmatch", ["post_id"], :name => "post_id"
  add_index "phpbb3_search_wordmatch", ["word_id", "post_id", "title_match"], :name => "unq_mtch", :unique => true
  add_index "phpbb3_search_wordmatch", ["word_id"], :name => "word_id"

  create_table "phpbb3_sessions", :primary_key => "session_id", :force => true do |t|
    t.integer "session_user_id",       :limit => 3,   :default => 0,     :null => false
    t.integer "session_forum_id",      :limit => 3,   :default => 0,     :null => false
    t.integer "session_last_visit",                   :default => 0,     :null => false
    t.integer "session_start",                        :default => 0,     :null => false
    t.integer "session_time",                         :default => 0,     :null => false
    t.string  "session_ip",            :limit => 40,  :default => "",    :null => false
    t.string  "session_browser",       :limit => 150, :default => "",    :null => false
    t.string  "session_forwarded_for",                :default => "",    :null => false
    t.string  "session_page",                         :default => "",    :null => false
    t.boolean "session_viewonline",                   :default => true,  :null => false
    t.boolean "session_autologin",                    :default => false, :null => false
    t.boolean "session_admin",                        :default => false, :null => false
  end

  add_index "phpbb3_sessions", ["session_forum_id"], :name => "session_fid"
  add_index "phpbb3_sessions", ["session_time"], :name => "session_time"
  add_index "phpbb3_sessions", ["session_user_id"], :name => "session_user_id"

  create_table "phpbb3_sessions_keys", :id => false, :force => true do |t|
    t.string  "key_id",     :limit => 32, :default => "", :null => false
    t.integer "user_id",    :limit => 3,  :default => 0,  :null => false
    t.string  "last_ip",    :limit => 40, :default => "", :null => false
    t.integer "last_login",               :default => 0,  :null => false
  end

  add_index "phpbb3_sessions_keys", ["last_login"], :name => "last_login"

  create_table "phpbb3_sitelist", :primary_key => "site_id", :force => true do |t|
    t.string  "site_ip",       :limit => 40, :default => "",    :null => false
    t.string  "site_hostname",               :default => "",    :null => false
    t.boolean "ip_exclude",                  :default => false, :null => false
  end

  create_table "phpbb3_smilies", :primary_key => "smiley_id", :force => true do |t|
    t.string  "code",               :limit => 50, :default => "",   :null => false
    t.string  "emotion",            :limit => 50, :default => "",   :null => false
    t.string  "smiley_url",         :limit => 50, :default => "",   :null => false
    t.integer "smiley_width",       :limit => 2,  :default => 0,    :null => false
    t.integer "smiley_height",      :limit => 2,  :default => 0,    :null => false
    t.integer "smiley_order",       :limit => 3,  :default => 0,    :null => false
    t.boolean "display_on_posting",               :default => true, :null => false
  end

  add_index "phpbb3_smilies", ["display_on_posting"], :name => "display_on_post"

  create_table "phpbb3_styles", :primary_key => "style_id", :force => true do |t|
    t.string  "style_name",                   :default => "",   :null => false
    t.string  "style_copyright",              :default => "",   :null => false
    t.boolean "style_active",                 :default => true, :null => false
    t.integer "template_id",     :limit => 3, :default => 0,    :null => false
    t.integer "theme_id",        :limit => 3, :default => 0,    :null => false
    t.integer "imageset_id",     :limit => 3, :default => 0,    :null => false
  end

  add_index "phpbb3_styles", ["imageset_id"], :name => "imageset_id"
  add_index "phpbb3_styles", ["style_name"], :name => "style_name", :unique => true
  add_index "phpbb3_styles", ["template_id"], :name => "template_id"
  add_index "phpbb3_styles", ["theme_id"], :name => "theme_id"

  create_table "phpbb3_styles_imageset", :primary_key => "imageset_id", :force => true do |t|
    t.string "imageset_name",                     :default => "", :null => false
    t.string "imageset_copyright",                :default => "", :null => false
    t.string "imageset_path",      :limit => 100, :default => "", :null => false
  end

  add_index "phpbb3_styles_imageset", ["imageset_name"], :name => "imgset_nm", :unique => true

  create_table "phpbb3_styles_imageset_data", :primary_key => "image_id", :force => true do |t|
    t.string  "image_name",     :limit => 200, :default => "", :null => false
    t.string  "image_filename", :limit => 200, :default => "", :null => false
    t.string  "image_lang",     :limit => 30,  :default => "", :null => false
    t.integer "image_height",   :limit => 2,   :default => 0,  :null => false
    t.integer "image_width",    :limit => 2,   :default => 0,  :null => false
    t.integer "imageset_id",    :limit => 3,   :default => 0,  :null => false
  end

  add_index "phpbb3_styles_imageset_data", ["imageset_id"], :name => "i_d"

  create_table "phpbb3_styles_template", :primary_key => "template_id", :force => true do |t|
    t.string  "template_name",                        :default => "",     :null => false
    t.string  "template_copyright",                   :default => "",     :null => false
    t.string  "template_path",         :limit => 100, :default => "",     :null => false
    t.string  "bbcode_bitfield",                      :default => "kNg=", :null => false
    t.boolean "template_storedb",                     :default => false,  :null => false
    t.integer "template_inherits_id",                 :default => 0,      :null => false
    t.binary  "template_inherit_path", :limit => 255,                     :null => false
  end

  add_index "phpbb3_styles_template", ["template_name"], :name => "tmplte_nm", :unique => true

  create_table "phpbb3_styles_template_data", :id => false, :force => true do |t|
    t.integer "template_id",       :limit => 3,        :default => 0,  :null => false
    t.string  "template_filename", :limit => 100,      :default => "", :null => false
    t.text    "template_included",                                     :null => false
    t.integer "template_mtime",                        :default => 0,  :null => false
    t.text    "template_data",     :limit => 16777215,                 :null => false
  end

  add_index "phpbb3_styles_template_data", ["template_filename"], :name => "tfn"
  add_index "phpbb3_styles_template_data", ["template_id"], :name => "tid"

  create_table "phpbb3_styles_theme", :primary_key => "theme_id", :force => true do |t|
    t.string  "theme_name",                          :default => "",    :null => false
    t.string  "theme_copyright",                     :default => "",    :null => false
    t.string  "theme_path",      :limit => 100,      :default => "",    :null => false
    t.boolean "theme_storedb",                       :default => false, :null => false
    t.integer "theme_mtime",                         :default => 0,     :null => false
    t.text    "theme_data",      :limit => 16777215,                    :null => false
  end

  add_index "phpbb3_styles_theme", ["theme_name"], :name => "theme_name", :unique => true

  create_table "phpbb3_topics", :primary_key => "topic_id", :force => true do |t|
    t.integer "forum_id",                  :limit => 3, :default => 0,     :null => false
    t.integer "icon_id",                   :limit => 3, :default => 0,     :null => false
    t.boolean "topic_attachment",                       :default => false, :null => false
    t.boolean "topic_approved",                         :default => true,  :null => false
    t.boolean "topic_reported",                         :default => false, :null => false
    t.string  "topic_title",                            :default => "",    :null => false
    t.integer "topic_poster",              :limit => 3, :default => 0,     :null => false
    t.integer "topic_time",                             :default => 0,     :null => false
    t.integer "topic_time_limit",                       :default => 0,     :null => false
    t.integer "topic_views",               :limit => 3, :default => 0,     :null => false
    t.integer "topic_replies",             :limit => 3, :default => 0,     :null => false
    t.integer "topic_replies_real",        :limit => 3, :default => 0,     :null => false
    t.integer "topic_status",              :limit => 1, :default => 0,     :null => false
    t.integer "topic_type",                :limit => 1, :default => 0,     :null => false
    t.integer "topic_first_post_id",       :limit => 3, :default => 0,     :null => false
    t.string  "topic_first_poster_name",                :default => "",    :null => false
    t.string  "topic_first_poster_colour", :limit => 6, :default => "",    :null => false
    t.integer "topic_last_post_id",        :limit => 3, :default => 0,     :null => false
    t.integer "topic_last_poster_id",      :limit => 3, :default => 0,     :null => false
    t.string  "topic_last_poster_name",                 :default => "",    :null => false
    t.string  "topic_last_poster_colour",  :limit => 6, :default => "",    :null => false
    t.string  "topic_last_post_subject",                :default => "",    :null => false
    t.integer "topic_last_post_time",                   :default => 0,     :null => false
    t.integer "topic_last_view_time",                   :default => 0,     :null => false
    t.integer "topic_moved_id",            :limit => 3, :default => 0,     :null => false
    t.boolean "topic_bumped",                           :default => false, :null => false
    t.integer "topic_bumper",              :limit => 3, :default => 0,     :null => false
    t.string  "poll_title",                             :default => "",    :null => false
    t.integer "poll_start",                             :default => 0,     :null => false
    t.integer "poll_length",                            :default => 0,     :null => false
    t.integer "poll_max_options",          :limit => 1, :default => 1,     :null => false
    t.integer "poll_last_vote",                         :default => 0,     :null => false
    t.boolean "poll_vote_change",                       :default => false, :null => false
  end

  add_index "phpbb3_topics", ["forum_id", "topic_approved", "topic_last_post_id"], :name => "forum_appr_last"
  add_index "phpbb3_topics", ["forum_id", "topic_last_post_time", "topic_moved_id"], :name => "fid_time_moved"
  add_index "phpbb3_topics", ["forum_id", "topic_type"], :name => "forum_id_type"
  add_index "phpbb3_topics", ["forum_id"], :name => "forum_id"
  add_index "phpbb3_topics", ["topic_approved"], :name => "topic_approved"
  add_index "phpbb3_topics", ["topic_last_post_time"], :name => "last_post_time"

  create_table "phpbb3_topics_posted", :id => false, :force => true do |t|
    t.integer "user_id",      :limit => 3, :default => 0,     :null => false
    t.integer "topic_id",     :limit => 3, :default => 0,     :null => false
    t.boolean "topic_posted",              :default => false, :null => false
  end

  create_table "phpbb3_topics_track", :id => false, :force => true do |t|
    t.integer "user_id",   :limit => 3, :default => 0, :null => false
    t.integer "topic_id",  :limit => 3, :default => 0, :null => false
    t.integer "forum_id",  :limit => 3, :default => 0, :null => false
    t.integer "mark_time",              :default => 0, :null => false
  end

  add_index "phpbb3_topics_track", ["forum_id"], :name => "forum_id"
  add_index "phpbb3_topics_track", ["topic_id"], :name => "topic_id"

  create_table "phpbb3_topics_watch", :id => false, :force => true do |t|
    t.integer "topic_id",      :limit => 3, :default => 0,     :null => false
    t.integer "user_id",       :limit => 3, :default => 0,     :null => false
    t.boolean "notify_status",              :default => false, :null => false
  end

  add_index "phpbb3_topics_watch", ["notify_status"], :name => "notify_stat"
  add_index "phpbb3_topics_watch", ["topic_id"], :name => "topic_id"
  add_index "phpbb3_topics_watch", ["user_id"], :name => "user_id"

  create_table "phpbb3_user_group", :id => false, :force => true do |t|
    t.integer "group_id",     :limit => 3, :default => 0,     :null => false
    t.integer "user_id",      :limit => 3, :default => 0,     :null => false
    t.boolean "group_leader",              :default => false, :null => false
    t.boolean "user_pending",              :default => true,  :null => false
  end

  add_index "phpbb3_user_group", ["group_id"], :name => "group_id"
  add_index "phpbb3_user_group", ["group_leader"], :name => "group_leader"
  add_index "phpbb3_user_group", ["user_id"], :name => "user_id"

  create_table "phpbb3_users", :primary_key => "user_id", :force => true do |t|
    t.integer "user_type",                :limit => 1,                                      :default => 0,           :null => false
    t.integer "group_id",                 :limit => 3,                                      :default => 3,           :null => false
    t.text    "user_permissions",         :limit => 16777215,                                                        :null => false
    t.integer "user_perm_from",           :limit => 3,                                      :default => 0,           :null => false
    t.string  "user_ip",                  :limit => 40,                                     :default => "",          :null => false
    t.integer "user_regdate",                                                               :default => 0,           :null => false
    t.string  "username",                                                                   :default => "",          :null => false
    t.string  "username_clean",                                                             :default => "",          :null => false
    t.string  "user_password",            :limit => 40,                                     :default => "",          :null => false
    t.integer "user_passchg",                                                               :default => 0,           :null => false
    t.boolean "user_pass_convert",                                                          :default => false,       :null => false
    t.string  "user_email",               :limit => 100,                                    :default => "",          :null => false
    t.integer "user_email_hash",          :limit => 8,                                      :default => 0,           :null => false
    t.string  "user_birthday",            :limit => 10,                                     :default => "",          :null => false
    t.integer "user_lastvisit",                                                             :default => 0,           :null => false
    t.integer "user_lastmark",                                                              :default => 0,           :null => false
    t.integer "user_lastpost_time",                                                         :default => 0,           :null => false
    t.string  "user_lastpage",            :limit => 200,                                    :default => "",          :null => false
    t.string  "user_last_confirm_key",    :limit => 10,                                     :default => "",          :null => false
    t.integer "user_last_search",                                                           :default => 0,           :null => false
    t.integer "user_warnings",            :limit => 1,                                      :default => 0,           :null => false
    t.integer "user_last_warning",                                                          :default => 0,           :null => false
    t.integer "user_login_attempts",      :limit => 1,                                      :default => 0,           :null => false
    t.integer "user_inactive_reason",     :limit => 1,                                      :default => 0,           :null => false
    t.integer "user_inactive_time",                                                         :default => 0,           :null => false
    t.integer "user_posts",               :limit => 3,                                      :default => 0,           :null => false
    t.string  "user_lang",                :limit => 30,                                     :default => "",          :null => false
    t.decimal "user_timezone",                                :precision => 5, :scale => 2, :default => 0.0,         :null => false
    t.boolean "user_dst",                                                                   :default => false,       :null => false
    t.string  "user_dateformat",          :limit => 30,                                     :default => "d M Y H:i", :null => false
    t.integer "user_style",               :limit => 3,                                      :default => 0,           :null => false
    t.integer "user_rank",                :limit => 3,                                      :default => 0,           :null => false
    t.string  "user_colour",              :limit => 6,                                      :default => "",          :null => false
    t.integer "user_new_privmsg",                                                           :default => 0,           :null => false
    t.integer "user_unread_privmsg",                                                        :default => 0,           :null => false
    t.integer "user_last_privmsg",                                                          :default => 0,           :null => false
    t.boolean "user_message_rules",                                                         :default => false,       :null => false
    t.integer "user_full_folder",                                                           :default => -3,          :null => false
    t.integer "user_emailtime",                                                             :default => 0,           :null => false
    t.integer "user_topic_show_days",     :limit => 2,                                      :default => 0,           :null => false
    t.string  "user_topic_sortby_type",   :limit => 1,                                      :default => "t",         :null => false
    t.string  "user_topic_sortby_dir",    :limit => 1,                                      :default => "d",         :null => false
    t.integer "user_post_show_days",      :limit => 2,                                      :default => 0,           :null => false
    t.string  "user_post_sortby_type",    :limit => 1,                                      :default => "t",         :null => false
    t.string  "user_post_sortby_dir",     :limit => 1,                                      :default => "a",         :null => false
    t.boolean "user_notify",                                                                :default => false,       :null => false
    t.boolean "user_notify_pm",                                                             :default => true,        :null => false
    t.integer "user_notify_type",         :limit => 1,                                      :default => 0,           :null => false
    t.boolean "user_allow_pm",                                                              :default => true,        :null => false
    t.boolean "user_allow_viewonline",                                                      :default => true,        :null => false
    t.boolean "user_allow_viewemail",                                                       :default => true,        :null => false
    t.boolean "user_allow_massemail",                                                       :default => true,        :null => false
    t.integer "user_options",                                                               :default => 230271,      :null => false
    t.string  "user_avatar",                                                                :default => "",          :null => false
    t.integer "user_avatar_type",         :limit => 1,                                      :default => 0,           :null => false
    t.integer "user_avatar_width",        :limit => 2,                                      :default => 0,           :null => false
    t.integer "user_avatar_height",       :limit => 2,                                      :default => 0,           :null => false
    t.text    "user_sig",                 :limit => 16777215,                                                        :null => false
    t.string  "user_sig_bbcode_uid",      :limit => 8,                                      :default => "",          :null => false
    t.string  "user_sig_bbcode_bitfield",                                                   :default => "",          :null => false
    t.string  "user_from",                :limit => 100,                                    :default => "",          :null => false
    t.string  "user_icq",                 :limit => 15,                                     :default => "",          :null => false
    t.string  "user_aim",                                                                   :default => "",          :null => false
    t.string  "user_yim",                                                                   :default => "",          :null => false
    t.string  "user_msnm",                                                                  :default => "",          :null => false
    t.string  "user_jabber",                                                                :default => "",          :null => false
    t.string  "user_website",             :limit => 200,                                    :default => "",          :null => false
    t.text    "user_occ",                                                                                            :null => false
    t.text    "user_interests",                                                                                      :null => false
    t.string  "user_actkey",              :limit => 32,                                     :default => "",          :null => false
    t.string  "user_newpasswd",           :limit => 40,                                     :default => "",          :null => false
    t.string  "user_form_salt",           :limit => 32,                                     :default => "",          :null => false
    t.boolean "user_new",                                                                   :default => true,        :null => false
    t.integer "user_reminded",            :limit => 1,                                      :default => 0,           :null => false
    t.integer "user_reminded_time",                                                         :default => 0,           :null => false
  end

  add_index "phpbb3_users", ["user_birthday"], :name => "user_birthday"
  add_index "phpbb3_users", ["user_email_hash"], :name => "user_email_hash"
  add_index "phpbb3_users", ["user_type"], :name => "user_type"
  add_index "phpbb3_users", ["username_clean"], :name => "username_clean", :unique => true

  create_table "phpbb3_warnings", :primary_key => "warning_id", :force => true do |t|
    t.integer "user_id",      :limit => 3, :default => 0, :null => false
    t.integer "post_id",      :limit => 3, :default => 0, :null => false
    t.integer "log_id",       :limit => 3, :default => 0, :null => false
    t.integer "warning_time",              :default => 0, :null => false
  end

  create_table "phpbb3_words", :primary_key => "word_id", :force => true do |t|
    t.string "word",        :default => "", :null => false
    t.string "replacement", :default => "", :null => false
  end

  create_table "phpbb3_zebra", :id => false, :force => true do |t|
    t.integer "user_id",  :limit => 3, :default => 0,     :null => false
    t.integer "zebra_id", :limit => 3, :default => 0,     :null => false
    t.boolean "friend",                :default => false, :null => false
    t.boolean "foe",                   :default => false, :null => false
  end

  create_table "tab_pyt1", :force => true do |t|
    t.string  "odp",    :limit => 256, :null => false
    t.integer "id_ank",                :null => false
  end

  create_table "tab_pyt3", :force => true do |t|
    t.string  "odp",    :limit => 256, :null => false
    t.integer "id_ank",                :null => false
  end

  create_table "tab_pyt4", :force => true do |t|
    t.string  "odp",    :limit => 256, :null => false
    t.integer "id_ank",                :null => false
  end

  create_table "wpbjk_comments", :primary_key => "comment_ID", :force => true do |t|
    t.integer  "comment_post_ID",                     :default => 0,   :null => false
    t.text     "comment_author",       :limit => 255,                  :null => false
    t.string   "comment_author_email", :limit => 100, :default => "",  :null => false
    t.string   "comment_author_url",   :limit => 200, :default => "",  :null => false
    t.string   "comment_author_IP",    :limit => 100, :default => "",  :null => false
    t.datetime "comment_date",                                         :null => false
    t.datetime "comment_date_gmt",                                     :null => false
    t.text     "comment_content",                                      :null => false
    t.integer  "comment_karma",                       :default => 0,   :null => false
    t.string   "comment_approved",     :limit => 20,  :default => "1", :null => false
    t.string   "comment_agent",                       :default => "",  :null => false
    t.string   "comment_type",         :limit => 20,  :default => "",  :null => false
    t.integer  "comment_parent",       :limit => 8,   :default => 0,   :null => false
    t.integer  "user_id",              :limit => 8,   :default => 0,   :null => false
  end

  add_index "wpbjk_comments", ["comment_approved", "comment_date_gmt"], :name => "comment_approved_date_gmt"
  add_index "wpbjk_comments", ["comment_approved"], :name => "comment_approved"
  add_index "wpbjk_comments", ["comment_date_gmt"], :name => "comment_date_gmt"
  add_index "wpbjk_comments", ["comment_post_ID"], :name => "comment_post_ID"

  create_table "wpbjk_links", :primary_key => "link_id", :force => true do |t|
    t.string   "link_url",                             :default => "",  :null => false
    t.string   "link_name",                            :default => "",  :null => false
    t.string   "link_image",                           :default => "",  :null => false
    t.string   "link_target",      :limit => 25,       :default => "",  :null => false
    t.integer  "link_category",    :limit => 8,        :default => 0,   :null => false
    t.string   "link_description",                     :default => "",  :null => false
    t.string   "link_visible",     :limit => 20,       :default => "Y", :null => false
    t.integer  "link_owner",                           :default => 1,   :null => false
    t.integer  "link_rating",                          :default => 0,   :null => false
    t.datetime "link_updated",                                          :null => false
    t.string   "link_rel",                             :default => "",  :null => false
    t.text     "link_notes",       :limit => 16777215,                  :null => false
    t.string   "link_rss",                             :default => "",  :null => false
  end

  add_index "wpbjk_links", ["link_category"], :name => "link_category"
  add_index "wpbjk_links", ["link_visible"], :name => "link_visible"

  create_table "wpbjk_options", :id => false, :force => true do |t|
    t.integer "option_id",    :limit => 8,                             :null => false
    t.integer "blog_id",                            :default => 0,     :null => false
    t.string  "option_name",  :limit => 64,         :default => "",    :null => false
    t.text    "option_value", :limit => 2147483647,                    :null => false
    t.string  "autoload",     :limit => 20,         :default => "yes", :null => false
  end

  add_index "wpbjk_options", ["option_name"], :name => "option_name"

  create_table "wpbjk_postmeta", :primary_key => "meta_id", :force => true do |t|
    t.integer "post_id",    :limit => 8,          :default => 0, :null => false
    t.string  "meta_key"
    t.text    "meta_value", :limit => 2147483647
  end

  add_index "wpbjk_postmeta", ["meta_key"], :name => "meta_key"
  add_index "wpbjk_postmeta", ["post_id"], :name => "post_id"

  create_table "wpbjk_posts", :primary_key => "ID", :force => true do |t|
    t.integer  "post_author",           :limit => 8,          :default => 0,         :null => false
    t.datetime "post_date",                                                          :null => false
    t.datetime "post_date_gmt",                                                      :null => false
    t.text     "post_content",          :limit => 2147483647,                        :null => false
    t.text     "post_title",                                                         :null => false
    t.integer  "post_category",                               :default => 0,         :null => false
    t.text     "post_excerpt",                                                       :null => false
    t.string   "post_status",           :limit => 20,         :default => "publish", :null => false
    t.string   "comment_status",        :limit => 20,         :default => "open",    :null => false
    t.string   "ping_status",           :limit => 20,         :default => "open",    :null => false
    t.string   "post_password",         :limit => 20,         :default => "",        :null => false
    t.string   "post_name",             :limit => 200,        :default => "",        :null => false
    t.text     "to_ping",                                                            :null => false
    t.text     "pinged",                                                             :null => false
    t.datetime "post_modified",                                                      :null => false
    t.datetime "post_modified_gmt",                                                  :null => false
    t.text     "post_content_filtered",                                              :null => false
    t.integer  "post_parent",           :limit => 8,          :default => 0,         :null => false
    t.string   "guid",                                        :default => "",        :null => false
    t.integer  "menu_order",                                  :default => 0,         :null => false
    t.string   "post_type",             :limit => 20,         :default => "post",    :null => false
    t.string   "post_mime_type",        :limit => 100,        :default => "",        :null => false
    t.integer  "comment_count",         :limit => 8,          :default => 0,         :null => false
  end

  add_index "wpbjk_posts", ["post_name"], :name => "post_name"
  add_index "wpbjk_posts", ["post_type", "post_status", "post_date", "ID"], :name => "type_status_date"

  create_table "wpbjk_term_relationships", :id => false, :force => true do |t|
    t.integer "object_id",        :limit => 8, :default => 0, :null => false
    t.integer "term_taxonomy_id", :limit => 8, :default => 0, :null => false
    t.integer "term_order",                    :default => 0, :null => false
  end

  add_index "wpbjk_term_relationships", ["term_taxonomy_id"], :name => "term_taxonomy_id"

  create_table "wpbjk_term_taxonomy", :primary_key => "term_taxonomy_id", :force => true do |t|
    t.integer "term_id",     :limit => 8,          :default => 0,  :null => false
    t.string  "taxonomy",    :limit => 32,         :default => "", :null => false
    t.text    "description", :limit => 2147483647,                 :null => false
    t.integer "parent",      :limit => 8,          :default => 0,  :null => false
    t.integer "count",       :limit => 8,          :default => 0,  :null => false
  end

  add_index "wpbjk_term_taxonomy", ["term_id", "taxonomy"], :name => "term_id_taxonomy", :unique => true

  create_table "wpbjk_terms", :primary_key => "term_id", :force => true do |t|
    t.string  "name",       :limit => 55,  :default => "", :null => false
    t.string  "slug",       :limit => 200, :default => "", :null => false
    t.integer "term_group", :limit => 8,   :default => 0,  :null => false
  end

  add_index "wpbjk_terms", ["slug"], :name => "slug", :unique => true

  create_table "wpbjk_usermeta", :primary_key => "umeta_id", :force => true do |t|
    t.integer "user_id",    :limit => 8,          :default => 0, :null => false
    t.string  "meta_key"
    t.text    "meta_value", :limit => 2147483647
  end

  add_index "wpbjk_usermeta", ["meta_key"], :name => "meta_key"
  add_index "wpbjk_usermeta", ["user_id"], :name => "user_id"

  create_table "wpbjk_users", :primary_key => "ID", :force => true do |t|
    t.string   "user_login",          :limit => 60,  :default => "", :null => false
    t.string   "user_pass",           :limit => 64,  :default => "", :null => false
    t.string   "user_nicename",       :limit => 50,  :default => "", :null => false
    t.string   "user_email",          :limit => 100, :default => "", :null => false
    t.string   "user_url",            :limit => 100, :default => "", :null => false
    t.datetime "user_registered",                                    :null => false
    t.string   "user_activation_key", :limit => 60,  :default => "", :null => false
    t.integer  "user_status",                        :default => 0,  :null => false
    t.string   "display_name",        :limit => 250, :default => "", :null => false
  end

  add_index "wpbjk_users", ["user_login"], :name => "user_login_key"
  add_index "wpbjk_users", ["user_nicename"], :name => "user_nicename"

end
