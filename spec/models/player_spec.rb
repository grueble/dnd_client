require 'spec_helper'

describe Player do
  subject { create(:player) }
  
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:game_id) }
  
  it { should belong_to(:user) }
  it { should belong_to(:game) }
  
  it { should validate_uniqueness_of(:user_id).scoped_to(:game_id) }
end
