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

ActiveRecord::Schema.define(version: 2020_01_05_092309) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "entities", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone"
    t.string "siret"
    t.string "bic"
    t.string "iban"
    t.text "footer"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "fields", force: :cascade do |t|
    t.string "reference"
    t.string "quantity"
    t.integer "unit_price"
    t.bigint "invoice_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["invoice_id"], name: "index_fields_on_invoice_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.string "reference"
    t.string "description"
    t.integer "number"
    t.string "tva"
    t.integer "total_ht"
    t.integer "total_ttc"
    t.integer "total_tva"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "entity_id"
    t.index ["entity_id"], name: "index_invoices_on_entity_id"
  end

  add_foreign_key "fields", "invoices"
end
