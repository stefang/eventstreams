require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should show front" do
    get :front
    assert_response :success
  end
end
