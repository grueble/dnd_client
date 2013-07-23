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

ActiveRecord::Schema.define(:version => 20130718221418) do

  create_table "characters", :force => true do |t|
    t.string   "name",                       :null => false
    t.integer  "level",                      :null => false
    t.integer  "hit_points",                 :null => false
    t.integer  "hit_die",                    :null => false
    t.integer  "strength",                   :null => false
    t.integer  "dexterity",                  :null => false
    t.integer  "constitution",               :null => false
    t.integer  "intelligence",               :null => false
    t.integer  "wisdom",                     :null => false
    t.integer  "charisma",                   :null => false
    t.string   "base_attack_progression",    :null => false
    t.string   "fortitude_save_progression", :null => false
    t.string   "reflex_save_progression",    :null => false
    t.string   "will_save_progression",      :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

end
