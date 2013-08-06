class PlayersController < ApplicationController
  before_filter :login_required, :only => [ :new, :create ]
  before_filter :load_game, :only => [ :new, :create ]
  
  def new
    @player = Player.new
  end
  
  def create
    @player = Player.new(params[:player])
    @player.game_id = @game.id
    if @player.save
      redirect_to @game, :notice => "You have successfully added a player"
    else
      render "new"
    end
  end
end
