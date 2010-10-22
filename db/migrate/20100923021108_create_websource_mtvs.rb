class CreateWebsourceMtvs < ActiveRecord::Migration
  def self.up
    create_table :websource_mtvs do |t|
      t.integer :altnet_id
      t.text :html
      t.text :url

      t.timestamps
    end
  end

  def self.down
    drop_table :websource_mtvs
  end
end
