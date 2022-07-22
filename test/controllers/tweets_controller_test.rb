require "test_helper"

class TweetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tweets_url
    assert_response :success
  end

  test "should create tweet" do
    user = create(:user)
    sign_in user
    @tweet = create(:tweet, user: user)

    assert_difference("Tweet.count") do
      post tweets_url, params: {tweet: {body: "My second tweet"}}
    end

    assert_redirected_to tweets_url
  end

  test "should show tweet" do
    user = create(:user)
    sign_in user
    @tweet = create(:tweet, user: user)
    get tweet_url(@tweet)
    assert_response :success
  end

  test "should get edit" do
    user = create(:user)
    sign_in user
    @tweet = create(:tweet, user: user)
    get edit_tweet_url(@tweet)
    assert_response :success
  end

  test "should update tweet" do
    user = create(:user)
    sign_in user
    @tweet = create(:tweet, user: user)
    patch tweet_url(@tweet), params: {tweet: {body: "Updated tweet"}}
    assert_redirected_to tweet_url(@tweet)
  end

  test "should destroy tweet" do
    user = create(:user)
    sign_in user
    @tweet = create(:tweet, user: user)
    @tweet2 = create(:tweet, user: user)

    assert_difference("Tweet.count", -1) do
      delete tweet_url(@tweet)
    end

    assert_redirected_to tweets_url
  end
end
