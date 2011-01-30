require 'test_helper'

class EventAssetTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert EventAsset.new.valid?
  end
end
