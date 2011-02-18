require 'test_helper'

class EventNewsTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert EventNews.new.valid?
  end
end
