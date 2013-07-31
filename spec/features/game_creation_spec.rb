require 'spec_helper'

describe 'the game creation process' do
  context 'signed in' do
  let(:user) { create(:user) }
  
  before do
    sign_in_as(user)
  end
  
    it 'creates a game' do
      visit '/games/new'
      
      fill_in 'Title', :with => 'My Game'
      
      expect { 
        click_button 'Create' 
        save_and_open_page
      }.to change{ Game.count }.by(1)
      
      page.should have_content 'My Game'
    end
  end
  
  it "fails to create an account" do
    visit '/games/new'
    
    expect { click_button 'Create' }.to_not change{ Game.count }
    
    page.should have_content "Title can't be blank"
  end
end