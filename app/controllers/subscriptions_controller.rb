class SubscriptionsController < ApplicationController
  before_action :set_user_subscriptions

  def index
    @user = current_user
    @subscriptions = @user.subscriptions
  end

  def show
    # @subscription = current_user.subscriptions.find(params[:id])

    # respond_to do |format|
    #   format.html
    #   format.turbo_stream
    # end
  end

  def new
    @feed = Feed.new
    respond_to do |format|
      format.html
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("main_content", template: "feeds/show")
      end
    end
  end

  def create
    @feed = Feed.find_or_initialize_by(feed_params)

    if @feed.save
      feed_parser = FeedsParserService.new(@feed).parse_feed
      current_user.subscribed_feeds << @feed
      binding.pry
      render turbo_stream: turbo_stream.replace("main_content", template: "feeds/show")
    else
      render turbo_stream: turbo_stream.replace("main_content", template: "subscriptions/new")
    end
  end

  private

  def feed_params
    params.require(:feed).permit(:title, :description, :url)
  end
end
