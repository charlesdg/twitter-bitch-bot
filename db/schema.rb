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

ActiveRecord::Schema.define(version: 20140823172846) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "followers", force: true do |t|
    t.integer  "tweets"
    t.integer  "following"
    t.integer  "followers_c"
    t.string   "username_twitter"
    t.string   "klout_id"
    t.integer  "klout_score"
    t.string   "location"
    t.string   "lang"
    t.datetime "last_tweet"
    t.integer  "influencer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "twitter_id",       limit: 8
  end

  add_index "followers", ["twitter_id"], name: "index_followers_on_twitter_id", unique: true, using: :btree

  create_table "influencers", force: true do |t|
    t.integer  "tweets"
    t.integer  "following"
    t.integer  "followers_c"
    t.string   "username_twitter"
    t.string   "klout_id"
    t.integer  "klout_score"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "twitter_id",       limit: 8
    t.string   "location"
  end

  add_index "influencers", ["twitter_id"], name: "index_influencers_on_twitter_id", unique: true, using: :btree

  create_table "topics", force: true do |t|
    t.integer  "influencer_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
