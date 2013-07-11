class DiceRollersController < ApplicationController
  def new
    @dice_roller = DiceRoller.new
  end
  
  def show
    @dice_roller = DiceRoller.find(params[:id])
  end
  
  def create
    @dice_roller = DiceRoller.create(params[:dice_roller])
    num_dice.each do |die|
      Dice.create(params[:sides])
    end
    if @dice_roller.save
      redirect_to @dice_roller
    else
      flash[:alert] = 'There was a problem creating your roll'
    end
  end
end


