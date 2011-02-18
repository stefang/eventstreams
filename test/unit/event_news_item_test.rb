require 'test_helper'

class EventNewsItemTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert EventNewsItem.new.valid?
  end
end
