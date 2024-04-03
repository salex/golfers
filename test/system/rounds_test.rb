require "application_system_test_case"

class RoundsTest < ApplicationSystemTestCase
  setup do
    @round = rounds(:one)
  end

  test "visiting the index" do
    visit rounds_url
    assert_selector "h1", text: "Rounds"
  end

  test "should create round" do
    visit rounds_url
    click_on "New round"

    fill_in "Back", with: @round.back
    fill_in "Date", with: @round.date
    fill_in "Front", with: @round.front
    fill_in "Game", with: @round.game_id
    fill_in "Limited", with: @round.limited
    fill_in "Other", with: @round.other
    fill_in "Par3", with: @round.par3
    fill_in "Player", with: @round.player_id
    fill_in "Quality", with: @round.quality
    fill_in "Quota", with: @round.quota
    fill_in "Skins", with: @round.skins
    fill_in "Team", with: @round.team
    fill_in "Tee", with: @round.tee
    fill_in "Total", with: @round.total
    fill_in "Type", with: @round.type
    click_on "Create Round"

    assert_text "Round was successfully created"
    click_on "Back"
  end

  test "should update Round" do
    visit round_url(@round)
    click_on "Edit this round", match: :first

    fill_in "Back", with: @round.back
    fill_in "Date", with: @round.date
    fill_in "Front", with: @round.front
    fill_in "Game", with: @round.game_id
    fill_in "Limited", with: @round.limited
    fill_in "Other", with: @round.other
    fill_in "Par3", with: @round.par3
    fill_in "Player", with: @round.player_id
    fill_in "Quality", with: @round.quality
    fill_in "Quota", with: @round.quota
    fill_in "Skins", with: @round.skins
    fill_in "Team", with: @round.team
    fill_in "Tee", with: @round.tee
    fill_in "Total", with: @round.total
    fill_in "Type", with: @round.type
    click_on "Update Round"

    assert_text "Round was successfully updated"
    click_on "Back"
  end

  test "should destroy Round" do
    visit round_url(@round)
    click_on "Destroy this round", match: :first

    assert_text "Round was successfully destroyed"
  end
end
