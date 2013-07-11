require 'spec_helper'

describe Dice do
  it { should allow_mass_assignment_of(:num_dice) }
  it { should allow_mass_assignment_of(:sides) }
  it { should validate_presence_of(:num_dice) }
  it { should validate_presence_of(:sides) }
  
  describe '#roll' do
    before { create(:dice) }
    
    dice.roll.should be_an_instance_of(Fixnum)
  end
end
