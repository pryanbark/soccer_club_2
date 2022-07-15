require "test_helper"

class Owners::DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get owners_dashboard_index_url
    assert_response :success
  end
end
