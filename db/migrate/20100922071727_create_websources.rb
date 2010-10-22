class CreateWebsources < ActiveRecord::Migration
  def self.up
    create_table :websources do |t|
      t.integer :altnet_id
      t.text :html
      t.integer :source

      t.timestamps
    end
  end

  def self.down
    drop_table :websources
  end
end
