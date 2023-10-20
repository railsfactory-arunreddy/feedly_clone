class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, if: Proc.new { |c| c.request.format != 'application/json' }
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
  before_action :set_user_subscriptions

  private

  def set_user_subscriptions
    @subscriptions = current_user.subscriptions
    @boards = current_user.boards
  end
end
