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

ActiveRecord::Schema.define(version: 20170724141646) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "experiment_results", force: :cascade do |t|
    t.integer  "experiment_task_result_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "experiment_id"
    t.string   "uuid"
    t.boolean  "completed"
    t.string   "input_type"
    t.string   "device_type"
    t.string   "ordering",                  default: [],              array: true
    t.index ["experiment_id"], name: "index_experiment_results_on_experiment_id", using: :btree
    t.index ["experiment_task_result_id"], name: "index_experiment_results_on_experiment_task_result_id", using: :btree
  end

  create_table "experiment_task_results", force: :cascade do |t|
    t.json     "result"
    t.integer  "experiment_task_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "experiment_result_id"
    t.index ["experiment_result_id"], name: "index_experiment_task_results_on_experiment_result_id", using: :btree
    t.index ["experiment_task_id"], name: "index_experiment_task_results_on_experiment_task_id", using: :btree
  end

  create_table "experiment_tasks", force: :cascade do |t|
    t.integer  "experiment_id"
    t.integer  "task_id"
    t.integer  "order"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["experiment_id"], name: "index_experiment_tasks_on_experiment_id", using: :btree
    t.index ["task_id"], name: "index_experiment_tasks_on_task_id", using: :btree
  end

  create_table "experiments", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "intro_html"
    t.string   "uuid"
    t.boolean  "active"
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.string   "taggable_type"
    t.integer  "taggable_id"
    t.string   "tagger_type"
    t.integer  "tagger_id"
    t.string   "context",       limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context", using: :btree
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
    t.index ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy", using: :btree
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id", using: :btree
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type", using: :btree
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type", using: :btree
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true, using: :btree
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "name"
    t.integer  "visualisation_id"
    t.string   "task_type"
    t.string   "description"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "no_of_clicks"
    t.string   "correct_coordinates", default: [],              array: true
    t.index ["visualisation_id"], name: "index_tasks_on_visualisation_id", using: :btree
  end

  create_table "visualisations", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "html"
    t.string   "img_src"
  end

  add_foreign_key "experiment_results", "experiment_task_results"
  add_foreign_key "experiment_results", "experiments"
  add_foreign_key "experiment_task_results", "experiment_results"
  add_foreign_key "experiment_task_results", "experiment_tasks"
  add_foreign_key "experiment_tasks", "experiments"
  add_foreign_key "experiment_tasks", "tasks"
  add_foreign_key "tasks", "visualisations"
end
