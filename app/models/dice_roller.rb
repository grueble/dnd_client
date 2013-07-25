class DiceRoller
  include ActiveModel::Validations
  extend ActiveModel::Translation
  include ActiveModel::Conversion
  
  SIDE_VALUES = [ 1, 2, 4, 6, 8, 10, 12, 20, 100 ]
  
  attr_accessor :num_dice, :sides
  
  validates :num_dice, :sides, :presence => true, 
            :numericality => {:only_integer => true, :greater_than => 0 }
            
  validates :sides, :inclusion => { :in => SIDE_VALUES }
  
  def initialize(attributes = {})
    @num_dice = attributes[:num_dice]
    @sides = attributes[:sides]
  end
  
  def roll_die
    rand(1..sides.to_i)
  end
  
  def persisted?
    false
  end
  
  def rolled_dice
    @rolled_dice ||= (1..num_dice.to_i).map{ roll_die }
  end
end