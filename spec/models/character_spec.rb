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
  it { should allow_mass_assignment_of(:base_attack_progression) }
  it { should allow_mass_assignment_of(:fortitude_save_progression) }
  it { should allow_mass_assignment_of(:reflex_save_progression) }
  it { should allow_mass_assignment_of(:will_save_progression) }
  
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
  it { should validate_presence_of(:base_attack_progression) }
  it { should validate_presence_of(:fortitude_save_progression) }
  it { should validate_presence_of(:reflex_save_progression) }
  it { should validate_presence_of(:will_save_progression) }
  
  it { should validate_numericality_of(:level) }
  it { should validate_numericality_of(:hit_points) }
  it { should validate_numericality_of(:hit_die) }
  it { should validate_numericality_of(:strength) }
  it { should validate_numericality_of(:dexterity) }
  it { should validate_numericality_of(:constitution) }
  it { should validate_numericality_of(:intelligence) }
  it { should validate_numericality_of(:wisdom) }
  it { should validate_numericality_of(:charisma) }
  
  describe 'initializing hit points on create' do
    it "correctly stores a character's hp" do
      subject.hit_points.should == 7
    end
  end
  
  describe '#attribute_bonus' do
    it "should output the proper attribute bonuses for an attribute > 10" do
      subject.attribute_bonus(:strength).should == 2
    end
    
    it "should output the proper attribute bonuses for an attribute < 10" do
      subject.attribute_bonus(:constitution).should == -1
    end
    
    it "should output the proper attribute bonuses for an attribute with no bonus" do
      subject.attribute_bonus(:wisdom).should == 0
    end
  end
  
  describe '#calculate_base_attack' do
    it "should correctly calculate a character's base attack bonus" do
      subject.calculate_base_attack.should == 1
    end
    
    context "a character's base attack bonus" do
      let(:character1) { create(:character, :level => 5, :base_attack_progression => 'good') }
      let(:character2) { create(:character, :level => 5, :base_attack_progression => 'average') }
      let(:character3) { create(:character, :level => 5, :base_attack_progression => 'poor') }
      
      it "should be correct for a 'good' base attack progression" do
        character1.calculate_base_attack.should == 5
      end
      
      it "should be correct for a 'average' base attack progression" do
        character2.calculate_base_attack.should == 3
      end
      
      it "should be correct for a 'poor' base attack progression" do
        character3.calculate_base_attack.should == 2
      end
    end
  end
  
  describe '#calculate_fortitude' do
    it "should correctly calculate a character's fortitude save" do
      subject.calculate_fortitude.should == 1
    end
    
    context "a character's base fortitude save" do
      let(:character1) { create(:character, :constitution => 10, :fortitude_save_progression => 'good') }
      let(:character2) { create(:character, :constitution => 10, :fortitude_save_progression => 'poor') }
      
      it "should be correct for a 'good' fortitude save progression" do
        character1.calculate_fortitude.should == 2
      end
      
      it "should be correct for a 'poor' fortitude save progression" do
        character2.calculate_fortitude.should == 0
      end
    end
  end
  
  describe '#calculate_reflex' do
    it "should correctly calculate a character's reflex save" do
      subject.calculate_reflex.should == 6
    end
    
    context "a character's base reflex save" do
      let(:character1) { create(:character, :dexterity => 10, :reflex_save_progression => 'good') }
      let(:character2) { create(:character, :dexterity => 10, :reflex_save_progression => 'poor') }
      
      it "should be correct for a 'good' reflex save progression" do
        character1.calculate_reflex.should == 2
      end
      
      it "should be correct for a 'poor' reflex save progression" do
        character2.calculate_reflex.should == 0
      end
    end
  end
  
  describe '#calculate_will' do
    it "should correctly calculate a character's will save" do
      subject.calculate_will.should == 0
    end
    
    context "a character's base will save" do
      let(:character1) { create(:character, :wisdom => 10, :will_save_progression => 'good') }
      let(:character2) { create(:character, :wisdom => 10, :will_save_progression => 'poor') }
      
      it "should be correct for a 'good' will save progression" do
        character1.calculate_will.should == 2
      end
      
      it "should be correct for a 'poor' will save progression" do
        character2.calculate_will.should == 0
      end
    end
  end
  
  describe '#calculate_grapple' do
    it "should correctly calculate a character's grapple bonus" do
      subject.calculate_grapple.should == 3
    end   
  end
end
