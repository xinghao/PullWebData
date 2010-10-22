class CreateRelateMtvs < ActiveRecord::Migration
  def self.up
    create_table :relate_mtvs do |t|
      t.integer :altnet_id
      t.integer :similar_artist_id
      t.integer :position
      t.float :score

      t.timestamps
    end
  end

  def self.down
    drop_table :relate_mtvs
  end
end
