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

ActiveRecord::Schema.define(version: 20161128111348) do

  create_table "achievements", force: :cascade do |t|
    t.string   "name"
    t.string   "icon"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "training_words", force: :cascade do |t|
    t.integer  "training_id"
    t.integer  "word_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["training_id"], name: "index_training_words_on_training_id"
    t.index ["word_id"], name: "index_training_words_on_word_id"
  end

  create_table "trainings", force: :cascade do |t|
    t.string   "name",       default: "Daily Training"
    t.string   "topic",      default: "all"
    t.string   "tier",       default: "higher"
    t.string   "language",   default: "german"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "user_words", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "word_id"
    t.integer  "stage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_words_on_user_id"
    t.index ["word_id"], name: "index_user_words_on_word_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",       null: false
    t.string   "encrypted_password",     default: "",       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "points",                 default: 0
    t.integer  "streak",                 default: 0
    t.string   "language_studied",       default: "german"
    t.string   "tier",                   default: "higher"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "words", force: :cascade do |t|
    t.string   "english"
    t.string   "tl"
    t.string   "language"
    t.string   "topic"
    t.string   "word_type"
    t.string   "tier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
