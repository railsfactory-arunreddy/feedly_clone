class ReadArticlesController < ApplicationController
  def read_index
    @articles = current_user.read_articles
  end

  def read_later_index
    @articles = current_user.read_later_articles
  end
end