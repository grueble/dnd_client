require 'spec_helper'

describe "the dice rolling process" do
  it "creates a dice roller object" do
    visit '/'
    
    fill_in 'Sides', :with => 1
    fill_in 'Num dice', :with => 1
    
    click_button 'Create'
    
    page.should have_content "1-sided die roll = 1"
  end
end