class CreateVenues < ActiveRecord::Migration
  def self.up
    create_table :venues do |t|
      t.string :name
      t.text :description
      t.string :address_1
      t.string :address_2
      t.string :address_3
      t.string :city
      t.string :county
      t.string :postcode
      t.float :lat
      t.float :lng
      t.string :website
      t.string :phone_number
      t.boolean :published
      t.timestamps
    end
  end
  
  def self.down
    drop_table :venues
  end
end
