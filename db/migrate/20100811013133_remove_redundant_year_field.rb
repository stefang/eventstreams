class RemoveRedundantYearField < ActiveRecord::Migration
  def self.up
    remove_column :events, :year
  end

  def self.down
    add_column :events, :year, :integer
  end
end
