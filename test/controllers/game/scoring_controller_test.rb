require "test_helper"

class Game::ScoringControllerTest < ActionDispatch::IntegrationTest
  test "should get games" do
    get game_scoring_games_url
    assert_response :success
  end

  test "should get par3s" do
    get game_scoring_par3s_url
    assert_response :success
  end

  test "should get skins" do
    get game_scoring_skins_url
    assert_response :success
  end
end
