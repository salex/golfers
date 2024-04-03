require "application_system_test_case"

class PlayersTest < ApplicationSystemTestCase
  setup do
    @player = players(:one)
  end

  test "visiting the index" do
    visit players_url
    assert_selector "h1", text: "Players"
  end

  test "should create player" do
    visit players_url
    click_on "New player"

    fill_in "First name", with: @player.first_name
    fill_in "Group", with: @player.group_id
    check "Is frozen" if @player.is_frozen
    fill_in "Last name", with: @player.last_name
    fill_in "Last played", with: @player.last_played
    fill_in "Limited", with: @player.limited
    fill_in "Name", with: @player.name
    fill_in "Nickname", with: @player.nickname
    fill_in "Phone", with: @player.phone
    fill_in "Pin", with: @player.pin
    fill_in "Quota", with: @player.quota
    fill_in "Rquota", with: @player.rquota
    fill_in "Tee", with: @player.tee
    check "Use nickname" if @player.use_nickname
    click_on "Create Player"

    assert_text "Player was successfully created"
    click_on "Back"
  end

  test "should update Player" do
    visit player_url(@player)
    click_on "Edit this player", match: :first

    fill_in "First name", with: @player.first_name
    fill_in "Group", with: @player.group_id
    check "Is frozen" if @player.is_frozen
    fill_in "Last name", with: @player.last_name
    fill_in "Last played", with: @player.last_played
    fill_in "Limited", with: @player.limited
    fill_in "Name", with: @player.name
    fill_in "Nickname", with: @player.nickname
    fill_in "Phone", with: @player.phone
    fill_in "Pin", with: @player.pin
    fill_in "Quota", with: @player.quota
    fill_in "Rquota", with: @player.rquota
    fill_in "Tee", with: @player.tee
    check "Use nickname" if @player.use_nickname
    click_on "Update Player"

    assert_text "Player was successfully updated"
    click_on "Back"
  end

  test "should destroy Player" do
    visit player_url(@player)
    click_on "Destroy this player", match: :first

    assert_text "Player was successfully destroyed"
  end
end
