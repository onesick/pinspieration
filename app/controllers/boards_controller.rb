class BoardsController < ApplicationController
  def index
    @boards=Board.all
  end

  def new
    @board=Board.new
  end

  def create
    @board=Board.create(board_params)

    redirect_to board_path(@board)
  end

  def show
    @board=Board.find(params[:id])
    @pins = @board.pins
  end

  # todo delete, edit, update

  private
  def board_params
    params.require(:board).permit(:title)
  end
end
