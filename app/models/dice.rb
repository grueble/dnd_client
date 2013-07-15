class Dice < ActiveRecord::Base
  attr_accessible :sides
  
  validates :sides, :presence => true
  
  belongs_to :dice_roller
  
  def roll
    @roll = 1.step(sides, 1).to_a.sample
  end
end
