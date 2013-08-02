require 'spec_helper'

describe Game do
  it { should allow_mass_assignment_of(:title) }
  it { should allow_mass_assignment_of(:description) }
  it { should allow_mass_assignment_of(:body) }
  
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:dungeon_master_id) }
end
