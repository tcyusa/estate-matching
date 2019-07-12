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

ActiveRecord::Schema.define(version: 2019_07_11_082013) do

  create_table "choices", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "estate_user_id"
    t.bigint "normal_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["estate_user_id", "normal_user_id"], name: "index_entries_on_estate_user_id_and_normal_user_id", unique: true
    t.index ["estate_user_id"], name: "index_entries_on_estate_user_id"
    t.index ["normal_user_id"], name: "index_entries_on_normal_user_id"
  end

  create_table "messages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "entry_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entry_id"], name: "index_messages_on_entry_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "offer_choice_relations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "offer_id"
    t.bigint "choice_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["choice_id"], name: "index_offer_choice_relations_on_choice_id"
    t.index ["offer_id", "choice_id"], name: "index_offer_choice_relations_on_offer_id_and_choice_id", unique: true
    t.index ["offer_id"], name: "index_offer_choice_relations_on_offer_id"
  end

  create_table "offer_city_relations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "offer_id"
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_offer_city_relations_on_city_id"
    t.index ["offer_id", "city_id"], name: "index_offer_city_relations_on_offer_id_and_city_id", unique: true
    t.index ["offer_id"], name: "index_offer_city_relations_on_offer_id"
  end

  create_table "offers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "min_price", default: 0
    t.integer "max_price", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "years", default: 0
    t.integer "walking_time", default: 0
    t.integer "min_size", default: 0
    t.boolean "is_family", default: false
    t.boolean "is_offered", default: false
    t.index ["user_id"], name: "index_offers_on_user_id"
  end

  create_table "profile_city_relations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "profile_id"
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_profile_city_relations_on_city_id"
    t.index ["profile_id", "city_id"], name: "index_profile_city_relations_on_profile_id_and_city_id", unique: true
    t.index ["profile_id"], name: "index_profile_city_relations_on_profile_id"
  end

  create_table "profiles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.text "pr"
    t.string "address"
    t.string "representative_name"
    t.string "tel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.boolean "is_estate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "entries", "users", column: "estate_user_id"
  add_foreign_key "entries", "users", column: "normal_user_id"
  add_foreign_key "messages", "entries"
  add_foreign_key "messages", "users"
  add_foreign_key "offer_choice_relations", "choices"
  add_foreign_key "offer_choice_relations", "offers"
  add_foreign_key "offer_city_relations", "cities"
  add_foreign_key "offer_city_relations", "offers"
  add_foreign_key "offers", "users"
  add_foreign_key "profile_city_relations", "cities"
  add_foreign_key "profile_city_relations", "profiles"
  add_foreign_key "profiles", "users"
end
