class ClearanceUpdateUsers < ActiveRecord::Migration
  def self.up
    change_table(:users) do |t|
      t.string :token, :limit => 128
      t.datetime :token_expires_at
    end
    
    add_index :users, [:id, :token]
    add_index :users, :token
  end
  
  def self.down
    change_table(:users) do |t|
      t.remove :token,:token_expires_at
    end
  end
end
