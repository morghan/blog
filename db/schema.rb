# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_08_21_175731) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "batches", id: :serial, force: :cascade do |t|
    t.string "batch_id"
    t.datetime "created_on", precision: nil
  end

  create_table "client_audience", id: :serial, force: :cascade do |t|
    t.string "list_id"
    t.string "client_id"
    t.datetime "added_on", precision: nil
  end

  create_table "comments", force: :cascade do |t|
    t.string "commenter"
    t.text "body"
    t.bigint "article_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_comments_on_article_id"
  end

  create_table "digital_broker_activity", id: :serial, force: :cascade do |t|
    t.bigint "watson_session_id"
    t.string "action"
    t.datetime "action_date", precision: nil
    t.string "action_type"
  end

  create_table "zoho_tokens", id: false, force: :cascade do |t|
    t.text "access_token"
    t.text "refresh_token"
    t.text "api_domain"
    t.text "token_type"
    t.integer "expires_in"
  end

  add_foreign_key "comments", "articles"
end
