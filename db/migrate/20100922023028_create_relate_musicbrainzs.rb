class CreateRelateMusicbrainzs < ActiveRecord::Migration
  def self.up
    create_table :relate_musicbrainzs do |t|
      t.integer :altnet_id
      t.integer :similar_artist_id
      t.integer :position
      t.float :score

      t.timestamps
    end
  end

  def self.down
    drop_table :relate_musicbrainzs
  end
end
