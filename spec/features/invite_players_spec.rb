require 'spec_helper'

describe 'adding players to a game' do
  context 'signed in' do
    let!(:user) { create(:user, :username => 'test') }
    let!(:user_dm) { create(:user, :username => 'dungeon_master')}
    let!(:game) { create(:game, :dungeon_master_id => user_dm.id) }
    
    before do
      sign_in_as(user_dm)
    end
    
    it 'adds a player to the game' do
      visit "/games/#{game.id}"
      
      click_link 'Add Player'
      
      select 'test', :from => 'Player'
      
      click_button 'Create'
      
      page.should have_content "You have successfully added a player"
    end
  end
end