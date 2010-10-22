class CreateAStats < ActiveRecord::Migration
  def self.up
    create_table :a_stats do |t|
      t.integer :altnet_id
      t.integer :status

      t.timestamps
    end
  end

  def self.down
    drop_table :a_stats
  end
end
