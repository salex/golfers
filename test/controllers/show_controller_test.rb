require "test_helper"

class ShowControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get show_update_url
    assert_response :success
  end

  test "should get form_teams" do
    get show_form_teams_url
    assert_response :success
  end
end
