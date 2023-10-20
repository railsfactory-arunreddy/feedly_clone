class BoardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @boards = current_user.boards
  end

  def new
    @board = Board.new
  end

  def create
    @board = current_user.boards.build(board_params)

    if @board.save
      redirect_to boards_path
    else
      render :new
    end
  end

  def show
    @board = current_user.boards.find(params[:id])
    @articles = @board.articles
    @active_board = @board
  end

  private

  def board_params
    params.require(:board).permit(:title, :description)
  end
end
