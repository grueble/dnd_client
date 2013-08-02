require 'spec_helper'

describe GamesController do
  let!(:user) { create(:user, :username => "dude") }
  
  context 'signed in' do
    before do
      login_as(user)
    end
    
    describe 'POST #create' do
      before { post :create, :game => { :title => "chillin" } }
      
      it "sets the current user as the dungeon master" do
        assigns(:game).dungeon_master.should == user
      end
    end
  end
end
