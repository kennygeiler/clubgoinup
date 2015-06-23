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

ActiveRecord::Schema.define(version: 20150612142803) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cert", force: :cascade do |t|
    t.string "name",  limit: 50
    t.string "value", limit: 2500
  end

  add_index "cert", ["name"], name: "ix_cert_name", unique: true, using: :btree

  create_table "friends", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "friend_id"
  end

  create_table "identity", force: :cascade do |t|
    t.string  "phone",      limit: 50
    t.string  "uuid",       limit: 255
    t.integer "invited_by",             array: true
    t.string  "likes",                  array: true
    t.string  "dislikes",               array: true
    t.string  "favorites",              array: true
  end

  add_index "identity", ["phone"], name: "ix_identity_phone", unique: true, using: :btree
  add_index "identity", ["uuid"], name: "ix_identity_uuid", unique: true, using: :btree

  create_table "lettuce", force: :cascade do |t|
    t.uuid     "uuid"
    t.string   "guests"
    t.string   "venue",   limit: 255
    t.datetime "date"
    t.string   "info"
    t.integer  "user_id"
  end

  add_index "lettuce", ["user_id"], name: "ix_lettuce_user_id", using: :btree
  add_index "lettuce", ["uuid"], name: "lettuce_uuid_key", unique: true, using: :btree

  create_table "mailboxer_conversation_opt_outs", force: :cascade do |t|
    t.integer "unsubscriber_id"
    t.string  "unsubscriber_type"
    t.integer "conversation_id"
  end

  add_index "mailboxer_conversation_opt_outs", ["conversation_id"], name: "index_mailboxer_conversation_opt_outs_on_conversation_id", using: :btree
  add_index "mailboxer_conversation_opt_outs", ["unsubscriber_id", "unsubscriber_type"], name: "index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type", using: :btree

  create_table "mailboxer_conversations", force: :cascade do |t|
    t.string   "subject",    default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "mailboxer_notifications", force: :cascade do |t|
    t.string   "type"
    t.text     "body"
    t.integer  "quote_id"
    t.string   "subject",              default: ""
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "conversation_id"
    t.boolean  "draft",                default: false
    t.string   "notification_code"
    t.integer  "notified_object_id"
    t.string   "notified_object_type"
    t.string   "attachment"
    t.datetime "updated_at",                           null: false
    t.datetime "created_at",                           null: false
    t.boolean  "global",               default: false
    t.datetime "expires"
  end

  add_index "mailboxer_notifications", ["conversation_id"], name: "index_mailboxer_notifications_on_conversation_id", using: :btree
  add_index "mailboxer_notifications", ["notified_object_id", "notified_object_type"], name: "index_mailboxer_notifications_on_notified_object_id_and_type", using: :btree
  add_index "mailboxer_notifications", ["sender_id", "sender_type"], name: "index_mailboxer_notifications_on_sender_id_and_sender_type", using: :btree
  add_index "mailboxer_notifications", ["type"], name: "index_mailboxer_notifications_on_type", using: :btree

  create_table "mailboxer_receipts", force: :cascade do |t|
    t.integer  "receiver_id"
    t.string   "receiver_type"
    t.integer  "notification_id",                            null: false
    t.boolean  "is_read",                    default: false
    t.boolean  "trashed",                    default: false
    t.boolean  "deleted",                    default: false
    t.string   "mailbox_type",    limit: 25
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "mailboxer_receipts", ["notification_id"], name: "index_mailboxer_receipts_on_notification_id", using: :btree
  add_index "mailboxer_receipts", ["receiver_id", "receiver_type"], name: "index_mailboxer_receipts_on_receiver_id_and_receiver_type", using: :btree

  create_table "promotors", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "company"
    t.string   "location",   null: false
    t.string   "email",      null: false
    t.text     "venues"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quotes", force: :cascade do |t|
    t.integer  "men"
    t.integer  "women"
    t.string   "min"
    t.string   "max"
    t.boolean  "bottles",    default: false
    t.text     "venues"
    t.date     "date",                       null: false
    t.string   "location",                   null: false
    t.text     "comments"
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "role", force: :cascade do |t|
    t.string "name",        limit: 80
    t.string "description", limit: 255
  end

  add_index "role", ["name"], name: "role_name_key", unique: true, using: :btree

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  create_table "user", force: :cascade do |t|
    t.string   "phone",        limit: 50
    t.string   "name",         limit: 100
    t.string   "password",     limit: 255
    t.string   "token",        limit: 255
    t.string   "device_token", limit: 255
    t.string   "pic_url",      limit: 255
    t.boolean  "active"
    t.datetime "confirmed_at"
    t.string   "invites"
    t.string   "info_dict"
    t.string   "token_dict"
    t.string   "likes",                    array: true
    t.string   "dislikes",                 array: true
    t.string   "favorites",                array: true
  end

  add_index "user", ["phone"], name: "ix_user_phone", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "image"
    t.string   "email"
    t.string   "user_friends"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_foreign_key "friends", "\"user\"", column: "friend_id", name: "friends_friend_id_fkey"
  add_foreign_key "friends", "\"user\"", column: "user_id", name: "friends_user_id_fkey"
  add_foreign_key "lettuce", "\"user\"", column: "user_id", name: "lettuce_user_id_fkey"
  add_foreign_key "mailboxer_conversation_opt_outs", "mailboxer_conversations", column: "conversation_id", name: "mb_opt_outs_on_conversations_id"
  add_foreign_key "mailboxer_notifications", "mailboxer_conversations", column: "conversation_id", name: "notifications_on_conversation_id"
  add_foreign_key "mailboxer_receipts", "mailboxer_notifications", column: "notification_id", name: "receipts_on_notification_id"
  add_foreign_key "roles_users", "\"user\"", column: "user_id", name: "roles_users_user_id_fkey"
  add_foreign_key "roles_users", "role", name: "roles_users_role_id_fkey"
end
