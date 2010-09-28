# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100928093423) do

  create_table "event_menus", :force => true do |t|
    t.string   "item_type"
    t.integer  "item_id"
    t.integer  "event_id"
    t.integer  "item_order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "url"
  end

  create_table "event_pages", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "event_id"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cached_slug"
    t.integer  "item_order"
  end

  add_index "event_pages", ["cached_slug"], :name => "index_event_pages_on_cached_slug"

  create_table "events", :force => true do |t|
    t.string   "title"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "subdomain"
    t.string   "hashtag"
    t.boolean  "published"
    t.string   "tagline"
    t.text     "description"
    t.text     "colours"
    t.string   "twitter_account"
    t.string   "custom_domain"
    t.string   "contact_form_email"
    t.string   "google_analytics"
  end

  create_table "invites", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "invite_code", :limit => 40
    t.datetime "invited_at"
    t.datetime "redeemed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invites", ["id", "email"], :name => "index_invites_on_id_and_email"
  add_index "invites", ["id", "invite_code"], :name => "index_invites_on_id_and_invite_code"

  create_table "links", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.integer  "event_id"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "slugs", :force => true do |t|
    t.string   "name"
    t.integer  "sluggable_id"
    t.integer  "sequence",                     :default => 1, :null => false
    t.string   "sluggable_type", :limit => 40
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "slugs", ["name", "sluggable_type", "sequence", "scope"], :name => "index_slugs_on_n_s_s_and_s", :unique => true
  add_index "slugs", ["sluggable_id"], :name => "index_slugs_on_sluggable_id"

  create_table "speakers", :force => true do |t|
    t.string   "name"
    t.text     "biog"
    t.integer  "event_id"
    t.integer  "talk_id"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "portrait_file_name"
    t.string   "portrait_content_type"
    t.integer  "portrait_file_size"
    t.datetime "portrait_updated_at"
    t.string   "cached_slug"
    t.integer  "item_order"
  end

  add_index "speakers", ["cached_slug"], :name => "index_speakers_on_cached_slug"

  create_table "speakers_talks", :id => false, :force => true do |t|
    t.integer "speaker_id"
    t.integer "talk_id"
  end

  create_table "talks", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "start"
    t.integer  "duration"
    t.integer  "track_id"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_id"
    t.integer  "venue_id"
    t.string   "cached_slug"
  end

  add_index "talks", ["cached_slug"], :name => "index_talks_on_cached_slug"

  create_table "tracks", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cached_slug"
    t.boolean  "published"
    t.integer  "item_order"
  end

  add_index "tracks", ["cached_slug"], :name => "index_tracks_on_cached_slug"

  create_table "tweets", :force => true do |t|
    t.integer  "twitter_id",        :limit => 8
    t.integer  "event_id"
    t.string   "text"
    t.string   "avatar"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "twitter_user_id"
    t.string   "tweet_type"
    t.string   "twitter_user_name"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "encrypted_password",  :limit => 128
    t.string   "salt",                :limit => 128
    t.string   "confirmation_token",  :limit => 128
    t.string   "remember_token",      :limit => 128
    t.boolean  "email_confirmed",                    :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "token",               :limit => 128
    t.datetime "token_expires_at"
    t.boolean  "superadmin",                         :default => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "nickname"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["id", "confirmation_token"], :name => "index_users_on_id_and_confirmation_token"
  add_index "users", ["id", "token"], :name => "index_users_on_id_and_token"
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"
  add_index "users", ["token"], :name => "index_users_on_token"

  create_table "venue_types", :force => true do |t|
    t.string   "name"
    t.integer  "event_id"
    t.boolean  "global"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cached_slug"
  end

  add_index "venue_types", ["cached_slug"], :name => "index_venue_types_on_cached_slug"

  create_table "venues", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "address_3"
    t.string   "city"
    t.string   "county"
    t.string   "postcode"
    t.float    "lat"
    t.float    "lng"
    t.string   "website"
    t.string   "phone_number"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "venue_type_id"
    t.integer  "event_id"
    t.string   "cached_slug"
    t.boolean  "main_venue",    :default => false
    t.string   "country"
  end

  add_index "venues", ["cached_slug"], :name => "index_venues_on_cached_slug"
  add_index "venues", ["lat", "lng"], :name => "index_venues_on_lat_and_lng"

  create_table "videos", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "vimeo_id"
    t.integer  "talk_id"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cached_slug"
    t.integer  "event_id"
  end

  add_index "videos", ["cached_slug"], :name => "index_videos_on_cached_slug"

end
