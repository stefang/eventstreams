require 'test_helper'

class EventMenuTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert EventMenu.new.valid?
  end
end
