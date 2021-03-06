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

ActiveRecord::Schema.define(:version => 20131024055905) do

  create_table "client_urls", :force => true do |t|
    t.integer  "client_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "directory_url"
  end

  create_table "clients", :force => true do |t|
    t.string   "business_name"
    t.string   "contact_person"
    t.string   "contact_number"
    t.string   "address"
    t.string   "company_representative"
    t.string   "email_address"
    t.integer  "user_id"
    t.boolean  "active"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "company_logo_file_name"
    t.string   "company_logo_content_type"
    t.integer  "company_logo_file_size"
    t.datetime "company_logo_updated_at"
    t.text     "sms_content"
    t.text     "thank_you_content"
    t.string   "twilio_number"
    t.string   "business_name_slug"
  end

  add_index "clients", ["user_id"], :name => "index_clients_on_user_id"

  create_table "review_statuses", :force => true do |t|
    t.boolean  "is_posted",     :default => false
    t.datetime "posted_on"
    t.boolean  "is_visible",    :default => false
    t.datetime "visible_on"
    t.integer  "client_url_id"
    t.integer  "review_id"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "reviews", :force => true do |t|
    t.text     "comment"
    t.integer  "rating"
    t.datetime "submitted_on"
    t.boolean  "posted_status"
    t.datetime "posted_on"
    t.integer  "client_id"
    t.integer  "customer_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "reviews", ["client_id"], :name => "index_reviews_on_client_id"
  add_index "reviews", ["customer_id"], :name => "index_reviews_on_customer_id"

  create_table "roles", :force => true do |t|
    t.string   "role_type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_roles", :force => true do |t|
    t.integer  "role_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "username"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
