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

ActiveRecord::Schema.define(:version => 20130506025402) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "addresses", :force => true do |t|
    t.string   "street"
    t.integer  "number"
    t.string   "district"
    t.string   "zip_code"
    t.string   "complement"
    t.integer  "city_id"
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "state_id"
  end

  add_index "addresses", ["addressable_id"], :name => "index_addresses_on_addressable_id"
  add_index "addresses", ["city_id"], :name => "index_addresses_on_city_id"
  add_index "addresses", ["state_id"], :name => "index_addresses_on_state_id"

  create_table "answers", :force => true do |t|
    t.text     "message"
    t.integer  "user_id"
    t.integer  "parent_id"
    t.integer  "answerable_id"
    t.string   "answerable_type"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "answers", ["answerable_id"], :name => "index_answers_on_answerable_id"
  add_index "answers", ["answerable_type"], :name => "index_answers_on_answerable_type"
  add_index "answers", ["parent_id"], :name => "index_answers_on_parent_id"
  add_index "answers", ["user_id"], :name => "index_answers_on_user_id"

  create_table "attachments", :force => true do |t|
    t.string   "file"
    t.string   "description"
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "attachments", ["attachable_id"], :name => "index_attachments_on_attachable_id"

  create_table "bulletins", :force => true do |t|
    t.text     "message"
    t.integer  "syndic_id"
    t.integer  "townhouse_id"
    t.boolean  "draft",          :default => true
    t.datetime "sent_at"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.string   "subject"
    t.string   "workflow_state"
  end

  add_index "bulletins", ["syndic_id"], :name => "index_bulletins_on_syndic_id"
  add_index "bulletins", ["townhouse_id"], :name => "index_bulletins_on_townhouse_id"

  create_table "calls", :force => true do |t|
    t.string   "subject"
    t.text     "message"
    t.boolean  "public"
    t.integer  "tenement_id"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.boolean  "draft",          :default => true
    t.datetime "sent_at"
    t.string   "workflow_state"
  end

  add_index "calls", ["tenement_id"], :name => "index_calls_on_tenement_id"

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "cities", ["state_id"], :name => "index_cities_on_state_id"

  create_table "expense_types", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "townhouse_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "expense_types", ["townhouse_id"], :name => "index_expense_types_on_townhouse_id"

  create_table "expenses", :force => true do |t|
    t.integer  "type_id"
    t.string   "description"
    t.date     "date"
    t.decimal  "value"
    t.integer  "townhouse_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "expenses", ["type_id"], :name => "index_expenses_on_type_id"

  create_table "income_types", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "townhouse_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "income_types", ["townhouse_id"], :name => "index_income_types_on_townhouse_id"

  create_table "incomes", :force => true do |t|
    t.integer  "type_id"
    t.string   "description"
    t.date     "date"
    t.decimal  "value"
    t.integer  "townhouse_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "incomes", ["type_id"], :name => "index_incomes_on_type_id"

  create_table "phones", :force => true do |t|
    t.string   "number"
    t.string   "description"
    t.integer  "phoneable_id"
    t.string   "phoneable_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "phones", ["phoneable_id"], :name => "index_phones_on_phoneable_id"

  create_table "states", :force => true do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "syndics_townhouses", :id => false, :force => true do |t|
    t.integer "syndic_id"
    t.integer "townhouse_id"
  end

  add_index "syndics_townhouses", ["syndic_id"], :name => "index_syndics_townhouses_on_syndic_id"
  add_index "syndics_townhouses", ["townhouse_id"], :name => "index_syndics_townhouses_on_townhouse_id"

  create_table "tenements", :force => true do |t|
    t.string   "location"
    t.decimal  "rent_value"
    t.integer  "townhouse_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "tenant_id"
  end

  add_index "tenements", ["tenant_id"], :name => "index_tenements_on_tenant_id"
  add_index "tenements", ["townhouse_id"], :name => "index_tenements_on_townhouse_id"

  create_table "townhouses", :force => true do |t|
    t.string   "name"
    t.string   "information"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
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
    t.string   "authentication_token"
    t.string   "name"
    t.string   "cpf"
    t.boolean  "active"
    t.string   "type"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["authentication_token", "type"], :name => "index_users_on_authentication_token_and_type", :unique => true
  add_index "users", ["email", "type"], :name => "index_users_on_email_and_type", :unique => true
  add_index "users", ["reset_password_token", "type"], :name => "index_users_on_reset_password_token_and_type", :unique => true

end
