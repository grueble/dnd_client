require 'spec_helper'

describe DiceRoller do
  it { should validate_presence_of :num_dice }
  it { should validate_presence_of :sides }
  it { should validate_numericality_of :num_dice }
  it { should validate_numericality_of :num_dice }
  
  describe '#roll_die' do
    let(:dice_roller) { DiceRoller.new(:num_dice => 1, :sides => 6) }
    
    it 'returns an acceptable value for a roll' do
      dice_roller.roll_die.should be_between(1, 6)
    end
  end
  
  describe '#rolled_dice' do
    
  end
end
