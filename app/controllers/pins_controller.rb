class PinsController < ApplicationController
  def index
    @board=Board.find(params[:board_id])
    @pin=Pin.all
  end

  def new
    @board=Board.find(params[:board_id])
    @pin=Pin.new
  end

  def edit
    @board=Board.find(params[:board_id])
    @pin=Pin.find(params[:id])
  end

  def create
    @board=Board.find(params[:board_id])
    @pin=@board.pins.create(pin_params)
    redirect_to board_pin_path(@board, @pin)
  end

  def show
    @board=Board.find(params[:board_id])
    @pin=Pin.find(params[:id])
  end

  def update
    @board=Board.find(params[:board_id])
    @pin=Pin.find(params[:id])
    @pin.update(pin_params)
    redirect_to @board
  end

  def destroy
    @pin=Pin.find(params[:id])
    @board = @pin.board
    @pin.destroy
    redirect_to @board
  end

  private
  def pin_params
    params.require(:pin).permit(:title, :pin_url)
  end
end
