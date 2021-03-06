class GamesController < ApplicationController
  before_filter :login_required, :only => [:new, :create]
  
  def new
    @game = Game.new
  end
  
  def show
    @game = Game.find(params[:id])
  end
  
  def create
    @game = Game.new(params[:game])
    @game.dungeon_master = current_user
    if @game.save
      redirect_to @game, :notice => "You have successfully created a game"
    else
      render "new"
    end
  end
  
  def index
    @games = Game.order("created_at DESC")
  end
end
