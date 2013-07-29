class CharactersController < ApplicationController
  def new
    @character = Character.new
  end
  
  def show
    @character = Character.find(params[:id])
  end
  
  def create
    @character = current_user.characters.build(params[:character])
    if @character.save
      redirect_to @character
    else
      render :new
    end
  end
end