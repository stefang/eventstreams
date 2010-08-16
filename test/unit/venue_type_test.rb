require 'test_helper'

class VenueTypeTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert VenueType.new.valid?
  end
end
