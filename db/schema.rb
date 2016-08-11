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

ActiveRecord::Schema.define(version: 20160804204500) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",              default: "", null: false
    t.string   "encrypted_password", default: "", null: false
    t.integer  "sign_in_count",      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",    default: 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "nombre",      null: false
    t.string   "descripcion", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "slug"
  end

  add_index "categories", ["nombre"], name: "index_categories_on_nombre", unique: true, using: :btree
  add_index "categories", ["slug"], name: "index_categories_on_slug", unique: true, using: :btree

  create_table "categories_productos", id: false, force: :cascade do |t|
    t.integer "producto_id", null: false
    t.integer "category_id", null: false
  end

  create_table "disenos", force: :cascade do |t|
    t.string   "diseno",     null: false
    t.string   "nombre",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
  end

  add_index "disenos", ["nombre"], name: "index_disenos_on_nombre", unique: true, using: :btree
  add_index "disenos", ["slug"], name: "index_disenos_on_slug", unique: true, using: :btree

  create_table "disenos_productos", id: false, force: :cascade do |t|
    t.integer "producto_id", null: false
    t.integer "diseno_id",   null: false
  end

  create_table "empleados", force: :cascade do |t|
    t.string   "first_name",                          null: false
    t.string   "last_name",                           null: false
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
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "active"
  end

  add_index "empleados", ["email"], name: "index_empleados_on_email", unique: true, using: :btree
  add_index "empleados", ["reset_password_token"], name: "index_empleados_on_reset_password_token", unique: true, using: :btree

  create_table "order_items", force: :cascade do |t|
    t.integer  "producto_id"
    t.integer  "order_id"
    t.decimal  "unit_price",  precision: 12, scale: 3
    t.integer  "quantity"
    t.decimal  "total_price", precision: 12, scale: 3
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "diseno_id"
  end

  add_index "order_items", ["diseno_id"], name: "index_order_items_on_diseno_id", using: :btree
  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree
  add_index "order_items", ["producto_id"], name: "index_order_items_on_producto_id", using: :btree

  create_table "order_statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.decimal  "subtotal",        precision: 12, scale: 3
    t.decimal  "tax",             precision: 12, scale: 3
    t.decimal  "shipping",        precision: 12, scale: 3
    t.decimal  "total",           precision: 12, scale: 3
    t.integer  "order_status_id"
    t.integer  "user_id"
    t.string   "nombre_res"
    t.string   "direccion"
    t.string   "ciudad"
    t.string   "estado"
    t.string   "pais"
    t.string   "cp"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "nombre"
    t.string   "apellido"
    t.string   "email"
  end

  add_index "orders", ["order_status_id"], name: "index_orders_on_order_status_id", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "productos", force: :cascade do |t|
    t.string   "fotografia"
    t.string   "producto",                            null: false
    t.string   "descripcion",                         null: false
    t.integer  "tamano_id"
    t.integer  "largo",                               null: false
    t.integer  "alto",                                null: false
    t.integer  "ancho",                               null: false
    t.decimal  "precio",      precision: 8, scale: 2, null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "productos", ["producto"], name: "index_productos_on_producto", using: :btree
  add_index "productos", ["tamano_id"], name: "index_productos_on_tamano_id", using: :btree

  create_table "tamanos", force: :cascade do |t|
    t.integer  "productos_id"
    t.string   "tamano",       null: false
    t.string   "descripcion",  null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "slug"
  end

  add_index "tamanos", ["productos_id"], name: "index_tamanos_on_productos_id", using: :btree
  add_index "tamanos", ["slug"], name: "index_tamanos_on_slug", unique: true, using: :btree
  add_index "tamanos", ["tamano"], name: "index_tamanos_on_tamano", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
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
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "lastname"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vent_items", force: :cascade do |t|
    t.integer  "producto_id"
    t.integer  "diseno_id"
    t.integer  "vent_id"
    t.decimal  "unit_price",  precision: 12, scale: 3
    t.integer  "quantity"
    t.decimal  "total_price", precision: 12, scale: 3
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "vent_items", ["diseno_id"], name: "index_vent_items_on_diseno_id", using: :btree
  add_index "vent_items", ["producto_id"], name: "index_vent_items_on_producto_id", using: :btree
  add_index "vent_items", ["vent_id"], name: "index_vent_items_on_vent_id", using: :btree

  create_table "vents", force: :cascade do |t|
    t.integer  "empleado_id"
    t.decimal  "total",       precision: 12, scale: 3
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "vents", ["empleado_id"], name: "index_vents_on_empleado_id", using: :btree

  add_foreign_key "order_items", "disenos"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "productos"
  add_foreign_key "orders", "order_statuses"
  add_foreign_key "orders", "users"
  add_foreign_key "productos", "tamanos"
  add_foreign_key "vent_items", "productos"
  add_foreign_key "vent_items", "vents"
  add_foreign_key "vents", "empleados"
end
