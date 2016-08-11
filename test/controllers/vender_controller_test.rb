require 'test_helper'

class VenderControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
