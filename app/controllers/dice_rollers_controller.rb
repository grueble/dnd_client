class DiceRollersController < ApplicationController
  def new
    @dice_roller = DiceRoller.new
  end
  
  def create
    @dice_roller = DiceRoller.new(params[:dice_roller])
  end
end


