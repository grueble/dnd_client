class DieController < ApplicationController
  def new
    @dice = Dice.new
  end
  
  def show
    @dice = Dice.find(params[:id])
  end
  
  def create
    @dice = Dice.create(params[:dice])
    if @dice.save
      redirect_to @dice
    end
  end
end