require 'spec_helper'

describe Character do
  subject { create(:character) }
  
  it { should allow_mass_assignment_of(:name) }
  it { should allow_mass_assignment_of(:level) }
  it { should allow_mass_assignment_of(:hit_points) }
  it { should allow_mass_assignment_of(:hit_die) }
  it { should allow_mass_assignment_of(:strength) }
  it { should allow_mass_assignment_of(:dexterity) }
  it { should allow_mass_assignment_of(:constitution) }
  it { should allow_mass_assignment_of(:intelligence) }
  it { should allow_mass_assignment_of(:wisdom) }
  it { should allow_mass_assignment_of(:charisma) }
  it { should allow_mass_assignment_of(:base_atk_prog) }
  it { should allow_mass_assignment_of(:fort_save_prog) }
  it { should allow_mass_assignment_of(:reflex_save_prog) }
  it { should allow_mass_assignment_of(:will_save_prog) }
  
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:level) }
  it { should validate_presence_of(:hit_points) }
  it { should validate_presence_of(:hit_die) }
  it { should validate_presence_of(:strength) }
  it { should validate_presence_of(:dexterity) }
  it { should validate_presence_of(:constitution) }
  it { should validate_presence_of(:intelligence) }
  it { should validate_presence_of(:wisdom) }
  it { should validate_presence_of(:charisma) }
  it { should validate_presence_of(:base_atk_prog) }
  it { should validate_presence_of(:fort_save_prog) }
  it { should validate_presence_of(:reflex_save_prog) }
  it { should validate_presence_of(:will_save_prog) }
  
  it { should validate_numericality_of(:level) }
  it { should validate_numericality_of(:hit_points) }
  it { should validate_numericality_of(:hit_die) }
  it { should validate_numericality_of(:strength) }
  it { should validate_numericality_of(:dexterity) }
  it { should validate_numericality_of(:constitution) }
  it { should validate_numericality_of(:intelligence) }
  it { should validate_numericality_of(:wisdom) }
  it { should validate_numericality_of(:charisma) }
  
  describe '#initialize_hit_points' do
    it "should correctly calculate a character's hp" do
      subject.initialize_hit_points.should == 8
    end
  end
  
  describe '#attribute_bonus' do
    it "should output the proper attribute bonuses for each attribute" do
      subject.attribute_bonus(subject.strength).should == 2
      subject.attribute_bonus(subject.dexterity).should == 4
      subject.attribute_bonus(subject.constitution).should == 0
      subject.attribute_bonus(subject.intelligence).should == 1
      subject.attribute_bonus(subject.wisdom).should == 1
      subject.attribute_bonus(subject.charisma).should == 3
    end
  end
  
  describe '#calculate_base_atk' do
    it "should correctly calculate a character's base atk bonus" do
      subject.calculate_base_atk.should == 1
    end
  end
  
  describe '#calculate_fortitude' do
    it "should correctly calculate a character's fortitude save" do
      subject.calculate_fortitude.should == 2
    end
  end
  
  describe '#calculate_reflex' do
    it "should correctly calculate a character's reflex save" do
      subject.calculate_reflex.should == 6
    end
  end
  
  describe '#calculate_will' do
    it "should correctly calculate a character's will save" do
      subject.calculate_will.should == 1
    end
  end
  
  describe '#calculate_grapple' do
    it "should correctly calculate a character's grapple bonus" do
      subject.calculate_grapple.should == 3
    end   
  end
  
  describe '#good_save_progression' do
    it 'should return the proper base save value' do
      subject.good_save_progression.should == 2
    end
  end
  
  describe '#poor_save_progressions' do
    it 'should return the proper base save value' do
      subject.poor_save_progression.should == 0
    end
  end
  
  describe '#good_base_atk' do
    it 'should return the proper base atk value' do
      subject.good_base_atk.should == 1
    end
  end
  
  describe '#average_base_atk' do
    it 'should return the proper base atk value' do
      subject.average_base_atk.should == 0
    end
  end
  
  describe '#poor_base_atk' do
    it 'should return the proper base atk value' do
      subject.poor_base_atk.should == 0
    end
  end
end
