require 'test_helper'

class PrControllerTest < ActionController::TestCase
  test "should get question" do
    get :question
    assert_response :success
  end

end
