class CreateVideos < ActiveRecord::Migration
  def self.up
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.integer :vimeo_id
      t.integer :talk_id
      t.boolean :published
      t.timestamps
    end
  end
  
  def self.down
    drop_table :videos
  end
end
