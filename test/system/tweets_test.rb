require "application_system_test_case"

class TweetsTest < ApplicationSystemTestCase
  setup do
    @tweet = tweets(:one)
  end

  test "visiting the index" do
    visit tweets_url
    assert_selector "h1", text: "Tweets"
  end

  test "creating a Tweet" do
    visit tweets_url

    fill_in "Body", with: @tweet.body
    click_on "Create Tweet"

    assert_text @tweet.body
  end

  test "updating a Tweet" do
    visit tweets_url
    click_on "Edit", match: :first

    fill_in "Body", with: @tweet.body
    click_on "Update Tweet"

    assert_text @tweet.body
  end

  test "destroying a Tweet" do
    visit tweets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tweet was successfully destroyed"
  end
end
