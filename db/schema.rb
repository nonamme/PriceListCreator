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

ActiveRecord::Schema.define(version: 2019_08_14_223420) do

  create_table "areas", force: :cascade do |t|
    t.integer "number"
    t.text "post_codes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "warehouse_id"
  end

  create_table "price_list_generators", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "price_lists", force: :cascade do |t|
    t.integer "number_of_pallets"
    t.float "net_rabate"
    t.float "net_logistic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "area_id"
  end

  create_table "warehouse_details", force: :cascade do |t|
    t.float "gross_price"
    t.float "sum_24_pal"
    t.float "price_pellete_per_tone"
    t.float "bag_price"
    t.float "palette_price"
    t.float "order_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "warehouse_id"
  end

  create_table "warehouses", force: :cascade do |t|
    t.string "warehouse_name"
    t.string "product"
    t.string "supplier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "warehouse_detail_id"
  end

end
