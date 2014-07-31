require 'test_helper'

class SchedulesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get test" do
    get :test
    assert_response :success
  end

end
