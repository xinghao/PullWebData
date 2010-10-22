class CreatePopularPStats < ActiveRecord::Migration
  def self.up
    create_table :popular_p_stats do |t|
      t.integer :altnet_id
      t.integer :mz
      t.integer :lastfm
      t.integer :echonest
      t.integer :yahoomusic
      t.integer :mtv

      t.timestamps
    end
    
    add_index :popular_p_stats, [:altnet_id]
  end

  def self.down
    remove_index :popular_p_stats, [:altnet_id]
    drop_table :popular_p_stats
  end
end
