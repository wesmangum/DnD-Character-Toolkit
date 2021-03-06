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

ActiveRecord::Schema.define(version: 20140925202624) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "race_id"
    t.integer  "dd_class_id"
    t.integer  "str"
    t.integer  "dex"
    t.integer  "const"
    t.integer  "int"
    t.integer  "wis"
    t.integer  "cha"
    t.integer  "climb"
    t.integer  "concentration"
    t.integer  "heal"
    t.integer  "intimidate"
    t.integer  "move_silently"
    t.integer  "spellcraft"
    t.string   "name"
    t.string   "sex"
    t.integer  "height"
    t.integer  "weight"
    t.string   "alignment"
    t.string   "background"
    t.string   "personality"
    t.string   "appearance"
    t.boolean  "finalized?",    default: false
  end

  add_index "characters", ["race_id"], name: "index_characters_on_race_id", using: :btree
  add_index "characters", ["user_id"], name: "index_characters_on_user_id", using: :btree

  create_table "classes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.string   "image"
  end

  create_table "races", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.text     "description"
    t.string   "image"
  end

  create_table "skills", force: true do |t|
    t.string  "name"
    t.string  "key_ability"
    t.integer "fighter_proficiency"
    t.integer "wizard_proficiency"
    t.integer "monk_proficiency"
    t.integer "barbarian_proficiency"
    t.integer "bard_proficiency"
    t.integer "cleric_proficiency"
    t.integer "druid_proficiency"
    t.integer "paladin_proficiency"
    t.integer "ranger_proficiency"
    t.integer "rogue_proficiency"
    t.integer "sorcerer_proficiency"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
