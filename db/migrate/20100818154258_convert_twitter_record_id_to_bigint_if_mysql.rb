class ConvertTwitterRecordIdToBigintIfMysql < ActiveRecord::Migration
  def self.up
    execute("ALTER TABLE tweets MODIFY id BIGINT UNSIGNED AUTO_INCREMENT") if ActiveRecord::Base.connection.adapter_name == 'MySQL'
  end

  def self.down
  end
end
