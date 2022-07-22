require "application_system_test_case"
require "test_helper"

class TweetsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit tweets_url
    assert_selector "h1", text: "Tweets"
  end

  test "creating a Tweet" do
    visit tweets_url
    user = create(:user)
    sign_in user

    fill_in "Body", with: "My first tweet"
    click_on "Create Tweet"

    assert_text "My first tweet"
  end

  test "updating a Tweet" do
    visit tweets_url
    user = create(:user)
    sign_in user
    @tweet = create(:tweet, user: user)

    assert_text "New Tweet"

    click_on "Edit"

    sleep 0.5

    page.all(:fillable_field, "Body")[1].set("My first tweet")
    click_on "Update Tweet"

    assert_text "My first tweet"
  end

  test "destroying a Tweet" do
    visit tweets_url
    user = create(:user)
    sign_in user
    @tweet = create(:tweet, user: user)

    sleep 0.5

    page.accept_confirm do
      click_on "Destroy"
    end

    assert_text "Tweet was successfully destroyed"
  end
end
