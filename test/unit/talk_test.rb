require 'test_helper'

class TalkTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Talk.new.valid?
  end
end
