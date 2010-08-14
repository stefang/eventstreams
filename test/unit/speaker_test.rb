require 'test_helper'

class SpeakerTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Speaker.new.valid?
  end
end
