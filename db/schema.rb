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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120209052150) do

  create_table "dept_hierarchies", :id => false, :force => true do |t|
    t.integer "ancestor_id",   :null => false
    t.integer "descendant_id", :null => false
    t.integer "generations",   :null => false
  end

  add_index "dept_hierarchies", ["ancestor_id", "descendant_id"], :name => "index_dept_hierarchies_on_ancestor_id_and_descendant_id", :unique => true
  add_index "dept_hierarchies", ["descendant_id"], :name => "index_dept_hierarchies_on_descendant_id"

  create_table "depts", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
    t.integer  "manager_id"
  end

  create_table "employment_histories", :force => true do |t|
    t.integer  "human_id"
    t.integer  "level_id"
    t.integer  "title_id"
    t.date     "start_from"
    t.integer  "monthly_pay"
    t.float    "base_rate",          :default => 0.8
    t.integer  "pay_month_per_year", :default => 15
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "reason"
    t.text     "comment"
  end

  create_table "humen", :force => true do |t|
    t.string   "name"
    t.date     "board_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "dept_id"
    t.string   "gender"
    t.date     "birthday"
    t.string   "hometown"
    t.string   "mobile"
    t.string   "home_address"
    t.string   "major_skill"
    t.string   "other_skills"
    t.string   "marriage_state",    :default => "unknown"
    t.string   "id_card_no"
    t.string   "email"
    t.string   "login"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.integer  "title_id"
    t.string   "employment_state",  :default => "normal"
  end

  create_table "interview_histories", :force => true do |t|
    t.date     "interview_date"
    t.integer  "interviewer_id"
    t.text     "words"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "human_id"
  end

  create_table "levels", :force => true do |t|
    t.string   "level"
    t.string   "band"
    t.integer  "salary_from"
    t.integer  "salary_to"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", :force => true do |t|
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "salary_histories", :force => true do |t|
    t.integer  "monthly_pay"
    t.float    "base_rate"
    t.integer  "pay_month_per_year"
    t.integer  "eval_interval"
    t.date     "effective_date"
    t.integer  "human_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "titles", :force => true do |t|
    t.string   "title"
    t.string   "band"
    t.text     "job_desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
