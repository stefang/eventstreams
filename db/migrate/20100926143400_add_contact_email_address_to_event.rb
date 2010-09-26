class AddContactEmailAddressToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :contact_form_email, :string
  end

  def self.down
    remove_column :events, :contact_form_email
  end
end
