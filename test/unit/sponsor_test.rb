require 'test_helper'

class SponsorTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Sponsor.new.valid?
  end
end
