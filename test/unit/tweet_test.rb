require 'test_helper'

class TweetTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Tweet.new.valid?
  end
end
