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

ActiveRecord::Schema.define(:version => 20101022020938) do

  create_table "a_stats", :force => true do |t|
    t.integer  "altnet_id"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "albums", :force => true do |t|
    t.string   "name",                                    :null => false
    t.string   "permalink"
    t.integer  "artist_id",                               :null => false
    t.string   "upc",                                     :null => false
    t.boolean  "explicit_advisory",    :default => false, :null => false
    t.integer  "altnet_object_id"
    t.datetime "refreshed_at"
    t.boolean  "featured"
    t.datetime "release_date",                            :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tracks_count",         :default => 0
    t.boolean  "published",            :default => false
    t.date     "valid_from"
    t.date     "valid_to"
    t.string   "altnet_directory"
    t.integer  "release_year"
    t.string   "image_small"
    t.string   "image_medium"
    t.string   "image_large"
    t.string   "label"
    t.string   "major_label"
    t.string   "copyright"
    t.boolean  "hidden"
    t.datetime "last_modified_date"
    t.boolean  "disabled"
    t.integer  "primary_genre_id"
    t.boolean  "editors_pick",         :default => false
    t.integer  "collection_object_id"
    t.boolean  "is_valid",             :default => false
    t.date     "actual_release_date"
  end

  add_index "albums", ["actual_release_date"], :name => "index_albums_on_actual_release_date"
  add_index "albums", ["altnet_object_id"], :name => "index_albums_on_altnet_object_id", :unique => true
  add_index "albums", ["artist_id", "id", "actual_release_date"], :name => "index_albums_on_artist_id_and_id_and_actual_release_date"
  add_index "albums", ["artist_id", "is_valid", "release_date"], :name => "index_albums_on_artist_id_and_is_valid_and_release_date"
  add_index "albums", ["artist_id", "primary_genre_id"], :name => "index_albums_on_artist_id_and_primary_genre_id"
  add_index "albums", ["editors_pick"], :name => "index_albums_on_editors_pick"
  add_index "albums", ["id", "is_valid"], :name => "index_albums_on_id_and_is_valid", :unique => true
  add_index "albums", ["is_valid", "primary_genre_id", "featured"], :name => "index_albums_on_is_valid_and_primary_genre_id_and_featured"
  add_index "albums", ["is_valid", "primary_genre_id", "release_date"], :name => "index_albums_on_is_valid_and_primary_genre_id_and_release_date"
  add_index "albums", ["is_valid", "primary_genre_id"], :name => "index_albums_on_is_valid_and_primary_genre_id"
  add_index "albums", ["is_valid"], :name => "index_albums_on_is_valid"
  add_index "albums", ["permalink", "artist_id", "is_valid"], :name => "index_albums_on_permalink_and_artist_id_and_is_valid", :unique => true
  add_index "albums", ["release_date", "release_year", "is_valid"], :name => "index_albums_on_release_date_and_release_year_and_is_valid"
  add_index "albums", ["upc"], :name => "index_albums_on_upc"

  create_table "artists", :force => true do |t|
    t.string   "name",                                                       :null => false
    t.string   "permalink"
    t.string   "type"
    t.datetime "refreshed_at"
    t.boolean  "featured"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "portrait_file_name"
    t.string   "portrait_content_type"
    t.integer  "tracks_count",                            :default => 0
    t.string   "portrait_bio_file_name"
    t.string   "portrait_bio_content_type"
    t.integer  "portrait_bio_file_size"
    t.datetime "portrait_bio_updated_at"
    t.integer  "primary_genre_id"
    t.string   "music_brainz_id",           :limit => 36
    t.string   "sortname"
    t.datetime "begin_date"
    t.datetime "end_date"
    t.string   "resolution"
    t.boolean  "editors_pick",                            :default => false
    t.integer  "albums_count",                            :default => 0
    t.boolean  "is_valid",                                :default => false
    t.string   "homepage_url"
    t.integer  "ringtones_count",                         :default => 0
  end

  add_index "artists", ["id", "is_valid", "name"], :name => "index_artists_on_id_and_is_valid_and_name", :unique => true
  add_index "artists", ["is_valid", "name"], :name => "index_artists_on_is_valid_and_name"
  add_index "artists", ["music_brainz_id", "is_valid"], :name => "index_artists_on_music_brainz_id_and_is_valid", :unique => true
  add_index "artists", ["name"], :name => "index_arists_name"
  add_index "artists", ["name"], :name => "index_artists_on_name"
  add_index "artists", ["permalink", "is_valid", "name"], :name => "index_artists_on_permalink_and_is_valid_and_name", :unique => true
  add_index "artists", ["primary_genre_id", "is_valid", "created_at"], :name => "index_artists_on_primary_genre_id_and_is_valid_and_created_at"
  add_index "artists", ["primary_genre_id", "is_valid", "name"], :name => "index_artists_on_primary_genre_id_and_is_valid_and_name"
  add_index "artists", ["primary_genre_id", "is_valid"], :name => "index_artists_on_primary_genre_id_and_is_valid"
  add_index "artists", ["primary_genre_id", "tracks_count", "created_at"], :name => "index_artists_on_primary_genre_id_tracks_count_created_at"
  add_index "artists", ["sortname", "is_valid"], :name => "index_artists_on_sortname_and_is_valid"

  create_table "p_stats", :force => true do |t|
    t.integer  "altnet_id"
    t.integer  "mz"
    t.integer  "lastfm"
    t.integer  "echonest"
    t.integer  "yahoomusic"
    t.integer  "mtv"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "popular_artists", :force => true do |t|
    t.integer  "artist_id"
    t.decimal  "playstats",  :precision => 65, :scale => 30
    t.decimal  "mz",         :precision => 65, :scale => 30
    t.decimal  "lastfm",     :precision => 65, :scale => 30
    t.decimal  "echonest",   :precision => 65, :scale => 30
    t.decimal  "yahoomusic", :precision => 65, :scale => 30
    t.decimal  "mtv",        :precision => 65, :scale => 30
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "popularity", :precision => 65, :scale => 30
  end

  add_index "popular_artists", ["artist_id"], :name => "index_popular_artists_on_artist_id"

  create_table "popular_p_album_stats", :force => true do |t|
    t.integer  "altnet_id"
    t.integer  "mz"
    t.integer  "lastfm"
    t.integer  "echonest"
    t.integer  "yahoomusic"
    t.integer  "mtv"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "popular_p_album_stats", ["altnet_id"], :name => "index_popular_p_album_stats_on_altnet_id"

  create_table "popular_p_stats", :force => true do |t|
    t.integer  "altnet_id"
    t.integer  "mz"
    t.integer  "lastfm"
    t.integer  "echonest"
    t.integer  "yahoomusic"
    t.integer  "mtv"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relate_echonests", :force => true do |t|
    t.integer  "altnet_id"
    t.integer  "similar_artist_id"
    t.integer  "position"
    t.float    "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relate_lastfms", :force => true do |t|
    t.integer  "altnet_id"
    t.integer  "similar_artist_id"
    t.integer  "position"
    t.float    "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relate_mtvs", :force => true do |t|
    t.integer  "altnet_id"
    t.integer  "similar_artist_id"
    t.integer  "position"
    t.float    "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relate_musicbrainzs", :force => true do |t|
    t.integer  "altnet_id"
    t.integer  "similar_artist_id"
    t.integer  "position"
    t.float    "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relate_yahoomusics", :force => true do |t|
    t.integer  "altnet_id"
    t.integer  "similar_artist_id"
    t.integer  "position"
    t.float    "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "similar_artists", :force => true do |t|
    t.integer  "artist_id"
    t.integer  "similar_artist_id"
    t.decimal  "similar_score",     :precision => 20, :scale => 15
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "similar_p_track_stats", :force => true do |t|
    t.integer  "altnet_id"
    t.integer  "mz"
    t.integer  "lastfm"
    t.integer  "echonest"
    t.integer  "yahoomusic"
    t.integer  "mtv"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "similar_p_track_stats", ["altnet_id"], :name => "index_similar_p_track_stats_on_altnet_id"

  create_table "websource_album_popular_lastfms", :force => true do |t|
    t.integer  "album_id"
    t.text     "html"
    t.text     "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "websource_artist_popular_echonests", :force => true do |t|
    t.integer  "altnet_id"
    t.text     "html"
    t.text     "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "websource_artist_popular_echonests", ["altnet_id"], :name => "index_websource_artist_popular_echonests_on_altnet_id"

  create_table "websource_artist_popular_lastfms", :force => true do |t|
    t.integer  "altnet_id"
    t.text     "html"
    t.text     "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "websource_echonests", :force => true do |t|
    t.integer  "altnet_id"
    t.text     "html"
    t.text     "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "websource_lastfms", :force => true do |t|
    t.integer  "altnet_id"
    t.text     "html"
    t.text     "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "websource_mtvs", :force => true do |t|
    t.integer  "altnet_id"
    t.text     "html"
    t.text     "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "websource_track_similar_lastfms", :force => true do |t|
    t.integer  "altnet_id"
    t.text     "html"
    t.text     "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "websource_track_similar_lastfms", ["altnet_id"], :name => "index_websource_track_similar_lastfms_on_altnet_id"

  create_table "websource_yahoomusics", :force => true do |t|
    t.integer  "altnet_id"
    t.text     "html"
    t.text     "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "websources", :force => true do |t|
    t.integer  "altnet_id"
    t.text     "html"
    t.integer  "source"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
