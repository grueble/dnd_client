require 'spec_helper'

describe Player do
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:game_id) }
  
  it { should belong_to(:user) }
  it { should belong_to(:game) }
end
