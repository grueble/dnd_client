class DiceRoller
  include ActiveModel::Validations
  extend ActiveModel::Translation
  include ActiveModel::Conversion
  
  attr_accessor :num_dice, :sides
  
  validates :num_dice, :sides, :presence => true, :numericality => {:only_integer => true}
  
  def initialize(attributes = {})
    @num_dice = attributes[:num_dice]
    @sides = attributes[:sides]
  end
  
  def roll_die
    1.step(sides.to_i, 1).to_a.sample
  end
  
  def persisted?
    false
  end
end