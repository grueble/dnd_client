class CharactersController < ApplicationController
  def new
    @character = Character.new
  end
  
  def show
    @character = Character.find(params[:id])
  end
  
  def create
    @character = Character.new(params[:character])
    # @character = current_user.character.build(params[:article])
    if @character.save
      redirect_to @character
    else
      render :new
    end
  end
end