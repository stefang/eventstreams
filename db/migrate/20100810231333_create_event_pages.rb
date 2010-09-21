class CreateEventPages < ActiveRecord::Migration
  def self.up
    create_table :event_pages do |t|
      t.string :title
      t.text :content
      t.integer :event_id
      t.boolean :published
      t.timestamps
    end
  end
  
  def self.down
    drop_table :event_pages
  end
end
