class ApplicationController < ActionController::Base
  before_action :set_user_subscriptions


  private

  def set_user_subscriptions
    @subscriptions = current_user.subscriptions
  end

  # def set_active_feed
  #   begin
  #     @feed = Feed.find(params[:id])
  #     @active_feed = @feed
  #   rescue ActiveRecord::RecordNotFound => e
  #     return
  #   end
  # end
end
