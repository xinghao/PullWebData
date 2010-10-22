class CreateSimilarArtists < ActiveRecord::Migration
  def self.up
    create_table :similar_artists do |t|
      t.integer :artist_id
      t.integer :similar_artist_id
      t.decimal :similar_score, :precision => 20, :scale => 15

      t.timestamps
    end
  end

  def self.down
    drop_table :similar_artists
  end
end
