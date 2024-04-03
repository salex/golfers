require "test_helper"

class CurrGroupControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get curr_group_show_url
    assert_response :success
  end

  test "should get edit" do
    get curr_group_edit_url
    assert_response :success
  end

  test "should get update" do
    get curr_group_update_url
    assert_response :success
  end
end
