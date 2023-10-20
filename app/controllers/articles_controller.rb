class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
  end

  def add_to_board
    article = Article.find(params[:article_id])
    board = Board.find(params[:board_id])

    article_board = ArticleBoard.create!(article: article, board: board)
    render json: { status: 'success' }
  end
end