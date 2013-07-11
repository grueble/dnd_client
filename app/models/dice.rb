class Dice < ActiveRecord::Base
  attr_accessible :sides
  
  validates :sides, :presence => true
  
  def roll
    @roll = 1.step(sides, 1).to_a.sample
  end
end
