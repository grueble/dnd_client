require 'spec_helper'

describe User do
  subject { create(:user) }
  
  it { should allow_mass_assignment_of(:username) }
  it { should allow_mass_assignment_of(:password) }
  it { should allow_mass_assignment_of(:password_confirmation) }

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password) }

  it { should validate_uniqueness_of(:username) }
  
  it { should have_many(:characters) }
  
  describe '.uninvited_for' do
    let!(:user1) { create(:user) }
    let!(:user2) { create(:user) }
    let!(:game) { create(:game, :dungeon_master_id => user1.id)}
    
    it "returns all articles in the correct order" do
      User.uninvited_for(game).should == [ user2 ]
    end
  end
end
