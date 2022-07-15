require "test_helper"

class Players::DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get players_dashboard_index_url
    assert_response :success
  end
end
