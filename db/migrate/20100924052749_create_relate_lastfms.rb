class CreateRelateLastfms < ActiveRecord::Migration
  def self.up
    create_table :relate_lastfms do |t|
      t.integer :altnet_id
      t.integer :similar_artist_id
      t.integer :position
      t.float :score

      t.timestamps
    end
  end

  def self.down
    drop_table :relate_lastfms
  end
end
