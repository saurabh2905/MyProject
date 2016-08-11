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

ActiveRecord::Schema.define(version: 20160808101218) do

  create_table "answers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "submitted_choice", limit: 1
    t.integer  "solution_id"
    t.integer  "problem_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["problem_id"], name: "index_answers_on_problem_id", using: :btree
    t.index ["solution_id"], name: "index_answers_on_solution_id", using: :btree
  end

  create_table "problems", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text     "question",          limit: 65535
    t.text     "optionA",           limit: 65535
    t.text     "optionB",           limit: 65535
    t.text     "optionC",           limit: 65535
    t.text     "optionD",           limit: 65535
    t.string   "correct_choice",    limit: 1
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "question_paper_id"
    t.index ["question_paper_id"], name: "fk_rails_7b1197ddf4", using: :btree
  end

  create_table "question_papers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "subject"
    t.integer  "number"
    t.integer  "time_in_minutes"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "solutions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "user_id"
    t.integer  "question_paper_id"
    t.float    "score",             limit: 24
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["question_paper_id"], name: "index_solutions_on_question_paper_id", using: :btree
    t.index ["user_id"], name: "index_solutions_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "email"
    t.string   "password"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "role",        default: "public"
    t.integer  "problems_id"
    t.index ["problems_id"], name: "index_users_on_problems_id", using: :btree
  end

  add_foreign_key "answers", "problems"
  add_foreign_key "answers", "solutions"
  add_foreign_key "problems", "question_papers"
  add_foreign_key "solutions", "question_papers"
  add_foreign_key "solutions", "users"
end
