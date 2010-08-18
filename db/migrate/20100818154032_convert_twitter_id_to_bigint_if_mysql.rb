class ConvertTwitterIdToBigintIfMysql < ActiveRecord::Migration
  def self.up
    execute("ALTER TABLE tweets MODIFY twitter_id BIGINT UNSIGNED") if ActiveRecord::Base.connection.adapter_name == 'MySQL'
  end

  def self.down
  end
end
