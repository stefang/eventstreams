class CreateSpeakers < ActiveRecord::Migration
  def self.up
    create_table :speakers do |t|
      t.string :name
      t.string :biog
      t.integer :event_id
      t.integer :talk_id
      t.boolean :published
      t.timestamps
    end
  end
  
  def self.down
    drop_table :speakers
  end
end
