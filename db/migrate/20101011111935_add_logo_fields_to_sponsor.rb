class AddLogoFieldsToSponsor < ActiveRecord::Migration
  def self.up
        add_column :sponsors, :logo_file_name,    :string
        add_column :sponsors, :logo_content_type, :string
        add_column :sponsors, :logo_file_size,    :integer
        add_column :sponsors, :logo_updated_at,   :datetime
      end

      def self.down
        remove_column :sponsors, :logo_file_name
        remove_column :sponsors, :logo_content_type
        remove_column :sponsors, :logo_file_size
        remove_column :sponsors, :logo_updated_at
      end
end
