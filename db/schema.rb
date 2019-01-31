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

ActiveRecord::Schema.define(version: 20190120135701) do

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "first_name_katakana", default: "", null: false
    t.string "last_name_katakana", default: "", null: false
    t.string "postal_code", limit: 7, default: "", null: false
    t.integer "prefecture", default: 0, null: false
    t.string "city", default: "", null: false
    t.string "address", default: "", null: false
    t.string "building_name", default: "", null: false
    t.string "landline_number", default: "", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "avatars", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "content", default: "", null: false
    t.integer "status", default: 0, null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_avatars_on_user_id"
  end

  create_table "brand_groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "brand_id", null: false
    t.bigint "group_id", null: false
    t.index ["brand_id"], name: "index_brand_groups_on_brand_id"
    t.index ["group_id"], name: "index_brand_groups_on_group_id"
  end

  create_table "brands", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", default: "", null: false
    t.string "initial_word", default: "", null: false
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id", null: false
    t.bigint "item_id", null: false
    t.text "text", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_comments_on_item_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "credits", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "credit_number", null: false
    t.string "limit_month", null: false
    t.string "limit_year", null: false
    t.string "security_code", null: false
    t.string "customer_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_credits_on_user_id"
  end

  create_table "groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", default: "", null: false
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", default: "", null: false
    t.text "description", null: false
    t.integer "state", default: 0, null: false
    t.integer "delivery_payer", default: 0, null: false
    t.integer "delivery_region", default: 0, null: false
    t.integer "delivery_duration", default: 0, null: false
    t.integer "buy_price", default: 0, null: false
    t.integer "sell_price", default: 0, null: false
    t.integer "commission_price", default: 0, null: false
    t.integer "transaction_stage", default: 0, null: false
    t.integer "like_count", default: 0, null: false
    t.bigint "size_id", null: false
    t.bigint "brand_id", null: false
    t.bigint "upper_category_id", null: false
    t.bigint "middle_category_id", null: false
    t.bigint "lower_category_id", null: false
    t.bigint "seller_id", null: false
    t.bigint "buyer_id", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_items_on_brand_id"
    t.index ["buyer_id"], name: "index_items_on_buyer_id"
    t.index ["lower_category_id"], name: "index_items_on_lower_category_id"
    t.index ["middle_category_id"], name: "index_items_on_middle_category_id"
    t.index ["seller_id"], name: "index_items_on_seller_id"
    t.index ["size_id"], name: "index_items_on_size_id"
    t.index ["upper_category_id"], name: "index_items_on_upper_category_id"
  end

  create_table "likes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_likes_on_item_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "lower_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", default: "", null: false
    t.bigint "middle_category_id", null: false
    t.index ["middle_category_id"], name: "index_lower_categories_on_middle_category_id"
  end

  create_table "middle_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", default: "", null: false
    t.bigint "upper_category_id", null: false
    t.bigint "size_type_id", null: false
    t.index ["size_type_id"], name: "index_middle_categories_on_size_type_id"
    t.index ["upper_category_id"], name: "index_middle_categories_on_upper_category_id"
  end

  create_table "mypages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "profile"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_mypages_on_user_id"
  end

  create_table "phone_numbers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "number", null: false
    t.integer "verification_code"
    t.integer "verification_code_confirmation"
    t.boolean "verified", default: false, null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_phone_numbers_on_user_id"
  end

  create_table "pictures", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "content", default: "", null: false
    t.integer "status", default: 0, null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_pictures_on_item_id"
  end

  create_table "reports", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_reports_on_item_id"
    t.index ["user_id"], name: "index_reports_on_user_id"
  end

  create_table "reviews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "text", null: false
    t.integer "evaluation", default: 0, null: false
    t.bigint "item_id", null: false
    t.bigint "appraiser_id", null: false
    t.bigint "appraisee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appraisee_id"], name: "index_reviews_on_appraisee_id"
    t.index ["appraiser_id"], name: "index_reviews_on_appraiser_id"
    t.index ["item_id"], name: "index_reviews_on_item_id"
  end

  create_table "size_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "size_type", default: "", null: false
  end

  create_table "sizes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", default: "", null: false
    t.bigint "size_type_id", null: false
    t.index ["size_type_id"], name: "index_sizes_on_size_type_id"
  end

  create_table "transaction_messages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id", null: false
    t.bigint "item_id", null: false
    t.text "text", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_transaction_messages_on_item_id"
    t.index ["user_id"], name: "index_transaction_messages_on_user_id"
  end

  create_table "upper_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", default: "", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "nickname", default: "", null: false
    t.string "uid", default: "", null: false
    t.string "provider", default: "", null: false
    t.integer "good_count", default: 0, null: false
    t.integer "normal_count", default: 0, null: false
    t.integer "bad_count", default: 0, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "avatars", "users"
  add_foreign_key "brand_groups", "brands"
  add_foreign_key "brand_groups", "groups"
  add_foreign_key "comments", "items"
  add_foreign_key "comments", "users"
  add_foreign_key "credits", "users"
  add_foreign_key "items", "brands"
  add_foreign_key "items", "lower_categories"
  add_foreign_key "items", "middle_categories"
  add_foreign_key "items", "sizes"
  add_foreign_key "items", "upper_categories"
  add_foreign_key "items", "users", column: "buyer_id"
  add_foreign_key "items", "users", column: "seller_id"
  add_foreign_key "likes", "items"
  add_foreign_key "likes", "users"
  add_foreign_key "lower_categories", "middle_categories"
  add_foreign_key "middle_categories", "size_types"
  add_foreign_key "middle_categories", "upper_categories"
  add_foreign_key "mypages", "users"
  add_foreign_key "phone_numbers", "users"
  add_foreign_key "pictures", "items"
  add_foreign_key "reports", "items"
  add_foreign_key "reports", "users"
  add_foreign_key "reviews", "items"
  add_foreign_key "reviews", "users", column: "appraisee_id"
  add_foreign_key "reviews", "users", column: "appraiser_id"
  add_foreign_key "sizes", "size_types"
  add_foreign_key "transaction_messages", "items"
  add_foreign_key "transaction_messages", "users"
end
