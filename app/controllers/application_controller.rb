class ApplicationController < ActionController::Base
  before_action :set_user_subscriptions


  private

  def set_user_subscriptions
    @subscriptions = current_user.subscriptions
  end
end
