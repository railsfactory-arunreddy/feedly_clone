require 'httparty'
require 'nokogiri'

class FeedsController < ApplicationController
  before_action :set_feed, only: %i[show]

  def index
    @feeds = Feed.all
  end

  def show
    @active_feed = @feed
    #feed_parser = FeedsParserService.new(@feed)
    #binding.pry
    @user = current_user
    @subscriptions = @user.subscriptions
    #@feed_items = feed_parser.parse_feed

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  def new
    @feed = Feed.new
  end

  def create
  end

  private

  def set_feed
    @feed = Feed.find(params[:id])
  end
end