class CreateSpeakerAndTalkJoinTable < ActiveRecord::Migration
  def self.up
    create_table :speakers_talks, :id => false do |t|
          t.integer :speaker_id
          t.integer :talk_id
    end
  end

  def self.down
    drop_table :speakers_talks
  end
end