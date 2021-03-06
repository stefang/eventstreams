class CreateInvites < ActiveRecord::Migration
  def self.up
    create_table :invites do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :invite_code, :limit => 40
      t.datetime :invited_at
      t.datetime :redeemed_at
      t.timestamps
    end
    add_index :invites, [:id, :email]
    add_index :invites, [:id, :invite_code]
  end
  
  def self.down
    drop_table :invites
  end
end
