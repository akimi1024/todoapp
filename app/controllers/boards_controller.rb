class BoardsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
  end

  def show
    @board = Board.find(params[:id])
  end

  def new
    @board = current_user.boards.build
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      redirect_to board_path(@board)
    else
      render :new
    end
  end

  def edit
  end

  def updated
  end

  def destroy
  end

  private
  def board_params
    params.require(:board).permit(:title, :content)
  end
end