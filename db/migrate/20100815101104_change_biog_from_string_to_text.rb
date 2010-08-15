class ChangeBiogFromStringToText < ActiveRecord::Migration
  def self.up
    change_column :speakers, :biog, :text
  end

  def self.down
    change_column :speakers, :biog, :string
  end
end
