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
    @pin=Pin.create(pin_params)
    @board=Board.find(params[:board_id])
    redirect_to board_pin_path(@board, @pin)
  end

  def show
    @board=Board.find(params[:board_id])
    @pin=Pin.find(params[:id])
  end

  private
  def pin_params
    params.require(:pin).permit(:title, :pin_url)
  end
end
