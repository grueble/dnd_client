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
    context '6 1-sided dice' do
      
      let(:dice_roller) { DiceRoller.new(:num_dice => 6, :sides => 1) }
      
      it 'returns an array of rolls' do
        dice_roller.rolled_dice.should == [ 1, 1, 1, 1, 1, 1 ]
      end
    end
    
    context '2 6-sided dice' do
      
      let(:dice_roller) { DiceRoller.new(:num_dice => 2, :sides => 6) }
      
      it 'uses #roll_die correctly' do
        dice_roller.should_receive(:roll_die).exactly(2).times
        
        dice_roller.rolled_dice
      end
    end
  end
end
