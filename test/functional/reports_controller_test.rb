require 'test_helper'

class ReportsControllerTest < ActionController::TestCase
  test "should get monthly" do
    get :monthly
    assert_response :success
  end

end
