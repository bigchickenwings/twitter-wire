require "test_helper"

class LikesControllerTest < ActionDispatch::IntegrationTest
  test "should like a tweet" do
    @user = create(:user)
    # puts "========="
    # puts "========="
    # email = @user.email
    # pw = @user.password
    # puts "========="
    # sign_in_as(email, pw)
    sign_in @user
    @tweet = create(:tweet, user: @user)
    @tweet2 = create(:tweet, body: "second tweet", user: @user)
    @like = create(:like, user: @user, tweet: @tweet)

    assert_difference("Like.count") do
      # binding.irb
      post tweet_likes_url, params: {
        likes: {
          tweet_id: @tweet2.id
        }
      }
    end

    assert_redirected_to tweets_url
  end

  test "should dislike a tweet" do
    @user = create(:user)
    sign_in @user
    @tweet = create(:tweet, user: @user)
    @tweet2 = create(:tweet, user: @user)

    assert_difference("Tweet.count", -1) do
      delete tweet_url(@tweet)
    end

    assert_redirected_to tweets_url
  end
end
