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

ActiveRecord::Schema.define(:version => 20120115081325) do

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
  end

  create_table "humen", :force => true do |t|
    t.string   "name"
    t.date     "board_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "dept_id"
  end

  create_table "interview_histories", :force => true do |t|
    t.date     "interview_date"
    t.integer  "interviewer_id"
    t.text     "words"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "human_id"
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

end
