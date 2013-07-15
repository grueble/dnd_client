class DiceRoller < ActiveRecord::Base
  attr_accessible :num_dice, :sides
  
  validates :num_dice, :sides, :presence => true
  validates_numericality_of :num_dice, :sides, :only_integer => true
  
  has_many :dice
end
