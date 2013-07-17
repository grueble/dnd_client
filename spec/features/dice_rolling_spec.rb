require 'spec_helper'

describe "the dice rolling process" do
  it "creates a dice roller object" do
    visit '/'
    
    fill_in 'num_dice', :with => 1
    fill_in 'sides', :with => 6
    
    expect{ click_button 'Create' }.to change{ DiceRoller.count }.by(1)
  end
end