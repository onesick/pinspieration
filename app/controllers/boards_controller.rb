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

  def destroy
    @board = Board.find(params[:id])
    @pins = @board.pins
    @pins.destroy_all
    @board.destroy
    redirect_to boards_path
  end

  def update
    @board = Board.find(params[:id])
    @board.update(board_params)
    redirect_to @board
  end

  def edit
    @board = Board.find(params[:id])
  end

  private
  def board_params
    params.require(:board).permit(:title)
  end
end
