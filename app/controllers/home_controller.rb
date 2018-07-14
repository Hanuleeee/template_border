class HomeController < ApplicationController
  def index
  end
  
  def submit
  end
  
  def tool
  end
  
  def show
    @boards = Board.order(:created_at).all
  end
  
  def create_board
    Board.create
    redirect_to :back
  end
  
  def state_update
    @board = Board.find(params[:id])
    @board.update(state: params[:state])
  end
end
