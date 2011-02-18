class CreateEventNewsItems < ActiveRecord::Migration
  def self.up
    create_table :event_news_items do |t|
      t.string :headline
      t.text :content
      t.date :item_date
      t.integer :event_id
      t.timestamps
    end
  end

  def self.down
    drop_table :event_news_items
  end
end
