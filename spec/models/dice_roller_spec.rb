require 'spec_helper'

describe DiceRoller do
  it { should validate_presence_of :num_dice }
  it { should validate_presence_of :sides }
  it { should validate_numericality_of :num_dice }
  it { should validate_numericality_of :num_dice }
  
  describe '#roll_die' do
    
  end
end
