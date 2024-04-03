require "test_helper"

class PlayersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @player = players(:one)
  end

  # test "should get index" do
  #   get players_url
  #   assert_response :success
  # end

  # test "should get new" do
  #   get new_player_url
  #   assert_response :success
  # end

  # test "should create player" do
  #   assert_difference("Player.count") do
  #     post players_url, params: { player: { first_name: @player.first_name, group_id: @player.group_id, is_frozen: @player.is_frozen, last_name: @player.last_name, last_played: @player.last_played, limited: @player.limited, name: @player.name, nickname: @player.nickname, phone: @player.phone, pin: @player.pin, quota: @player.quota, rquota: @player.rquota, tee: @player.tee, use_nickname: @player.use_nickname } }
  #   end

  #   assert_redirected_to player_url(Player.last)
  # end

  # test "should show player" do
  #   get player_url(@player)
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get edit_player_url(@player)
  #   assert_response :success
  # end

  # test "should update player" do
  #   patch player_url(@player), params: { player: { first_name: @player.first_name, group_id: @player.group_id, is_frozen: @player.is_frozen, last_name: @player.last_name, last_played: @player.last_played, limited: @player.limited, name: @player.name, nickname: @player.nickname, phone: @player.phone, pin: @player.pin, quota: @player.quota, rquota: @player.rquota, tee: @player.tee, use_nickname: @player.use_nickname } }
  #   assert_redirected_to player_url(@player)
  # end

  # test "should destroy player" do
  #   assert_difference("Player.count", -1) do
  #     delete player_url(@player)
  #   end

  #   assert_redirected_to players_url
  # end
end
