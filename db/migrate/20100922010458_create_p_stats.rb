class CreatePStats < ActiveRecord::Migration
  def self.up
    create_table :p_stats do |t|
      t.integer :altnet_id
      t.integer :mz
      t.integer :lastfm
      t.integer :echonest
      t.integer :yahoomusic
      t.integer :mtv

      t.timestamps
    end
  end

  def self.down
    drop_table :p_stats
  end
end
