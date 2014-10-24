require 'test_helper'

class SkillsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
