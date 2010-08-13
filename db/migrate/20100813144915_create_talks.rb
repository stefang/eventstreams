class CreateTalks < ActiveRecord::Migration
  def self.up
    create_table :talks do |t|
      t.string :title
      t.text :description
      t.datetime :start
      t.integer :duration
      t.integer :track_id
      t.boolean :published
      t.timestamps
    end
  end
  
  def self.down
    drop_table :talks
  end
end
