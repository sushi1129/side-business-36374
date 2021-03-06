# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_10_07_101140) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "item_bads", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_item_bads_on_item_id"
    t.index ["user_id"], name: "index_item_bads_on_user_id"
  end

  create_table "item_comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "text", null: false
    t.bigint "user_id", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_item_comments_on_item_id"
    t.index ["user_id"], name: "index_item_comments_on_user_id"
  end

  create_table "item_goods", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_item_goods_on_item_id"
    t.index ["user_id"], name: "index_item_goods_on_user_id"
  end

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "item_name", null: false
    t.string "maker", null: false
    t.integer "plice", null: false
    t.string "bought_store", null: false
    t.text "item_info"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "knowledge_bads", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "knowledge_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["knowledge_id"], name: "index_knowledge_bads_on_knowledge_id"
    t.index ["user_id"], name: "index_knowledge_bads_on_user_id"
  end

  create_table "knowledge_comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "text", null: false
    t.bigint "user_id", null: false
    t.bigint "knowledge_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["knowledge_id"], name: "index_knowledge_comments_on_knowledge_id"
    t.index ["user_id"], name: "index_knowledge_comments_on_user_id"
  end

  create_table "knowledge_goods", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "knowledge_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["knowledge_id"], name: "index_knowledge_goods_on_knowledge_id"
    t.index ["user_id"], name: "index_knowledge_goods_on_user_id"
  end

  create_table "knowledges", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "knowledge_title", null: false
    t.text "knowledge_info", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_knowledges_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nickname", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "last_name_kana", null: false
    t.string "first_name_kana", null: false
    t.date "birthday", null: false
    t.integer "prefecture_id", null: false
    t.string "phone_namber", null: false
    t.integer "os_type_id"
    t.string "use_app1"
    t.string "use_app2"
    t.text "profile"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["phone_namber"], name: "index_users_on_phone_namber", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "item_bads", "items"
  add_foreign_key "item_bads", "users"
  add_foreign_key "item_comments", "items"
  add_foreign_key "item_comments", "users"
  add_foreign_key "item_goods", "items"
  add_foreign_key "item_goods", "users"
  add_foreign_key "items", "users"
  add_foreign_key "knowledge_bads", "knowledges"
  add_foreign_key "knowledge_bads", "users"
  add_foreign_key "knowledge_comments", "knowledges"
  add_foreign_key "knowledge_comments", "users"
  add_foreign_key "knowledge_goods", "knowledges"
  add_foreign_key "knowledge_goods", "users"
  add_foreign_key "knowledges", "users"
end
