class LikesController < ApplicationController
  before_action :authenticate_user!#, only: %i[create destroy]
  before_action :set_tweet

  def create
    return if current_user.likes.find_by(tweet_id: @tweet.id)

    @like = current_user.likes.new(tweet_id: @tweet.id)

    respond_to do |format|
      if @like.save
        format.html { redirect_to tweets_url }
        format.json { render :show, status: :created, location: @tweet }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@tweet, partial: "tweets/form", locals: {tweet: @tweet}) }
        format.html { render :new }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @like = current_user.likes.find_by(tweet_id: @tweet.id)

    return unless @like

    @like.destroy

    respond_to do |format|
      format.html { redirect_to tweets_url }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end

end