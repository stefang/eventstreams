class AddColoursToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :colours, :text
  end

  def self.down
    remove_column :events, :colours
  end
end