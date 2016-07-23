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

ActiveRecord::Schema.define(version: 20160701081505) do

  create_table "articles", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "title",      limit: 255
    t.string   "url",        limit: 255
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "total_view", limit: 4,   default: 0
    t.integer  "score",      limit: 4,   default: 5
    t.boolean  "approved",               default: false
  end

  add_index "articles", ["user_id"], name: "index_articles_on_user_id", using: :btree

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "article_id", limit: 4
    t.integer  "status",     limit: 4, default: 0
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "favorites", ["article_id"], name: "index_favorites_on_article_id", using: :btree
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "provider",                   limit: 255,   default: "email", null: false
    t.string   "uid",                        limit: 255,   default: "",      null: false
    t.string   "encrypted_password",         limit: 255,   default: "",      null: false
    t.string   "reset_password_token",       limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",              limit: 4,     default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",         limit: 255
    t.string   "last_sign_in_ip",            limit: 255
    t.string   "confirmation_token",         limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",          limit: 255
    t.string   "name",                       limit: 255
    t.string   "nickname",                   limit: 255
    t.string   "image",                      limit: 255
    t.string   "email",                      limit: 255
    t.text     "tokens",                     limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "total_submit_articles",      limit: 4,     default: 0
    t.integer  "total_homepage_articles",    limit: 4,     default: 0
    t.integer  "total_removed_articles",     limit: 4,     default: 0
    t.integer  "total_sent_invitations",     limit: 4,     default: 0
    t.integer  "total_register_invitations", limit: 4,     default: 0
    t.integer  "total_days_as_member",       limit: 4,     default: 0
    t.datetime "birthday"
    t.integer  "political_persuasion",       limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree

  create_table "votes", force: :cascade do |t|
    t.float    "value",      limit: 24
    t.integer  "user_id",    limit: 4
    t.integer  "article_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "votes", ["article_id"], name: "index_votes_on_article_id", using: :btree
  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree

  add_foreign_key "articles", "users"
  add_foreign_key "favorites", "articles"
  add_foreign_key "favorites", "users"
  add_foreign_key "votes", "articles"
  add_foreign_key "votes", "users"
end
