class Character < ActiveRecord::Base
  BASE_ATK = [ 'good', 'average', 'poor' ]
  
  BASE_SAVE = [ 'good', 'poor' ]
  
  attr_accessible :name, :level, :hit_points, :hit_die, :strength, :dexterity, 
                  :constitution, :intelligence, :wisdom, :charisma, 
                  :base_attack_progression, :fortitude_save, 
                  :reflex_save, :will_save
                  
  validates :name, :level, :hit_points, :hit_die, :strength, :dexterity, :constitution, 
            :intelligence, :wisdom, :charisma, :base_attack_progression, :fortitude_save, 
            :reflex_save, :will_save, :user_id, :presence => true
            
  validates :level, :hit_points, :hit_die, :strength, :dexterity, :constitution,
            :intelligence, :wisdom, :charisma, :numericality => { :only_integer => true, 
            :greater_than => 0 }
            
  validates :fortitude_save, :reflex_save, :will_save, 
            :inclusion => { :in => BASE_SAVE }
            
  validates :base_attack_progression, :inclusion => { :in => BASE_ATK }
            
  before_validation :initialize_hit_points, :on => :create
  
  belongs_to :user
  
  def attribute_bonus(attribute)
    (self.send(attribute) - 10) / 2
  end
  
  def calculate_base_attack
    self.send("#{base_attack_progression}_base_attack")
  end
  
  def calculate_fortitude
    self.send("#{fortitude_save}_progression") + attribute_bonus(:constitution)
  end
  
  def calculate_reflex
    self.send("#{reflex_save}_progression") + attribute_bonus(:dexterity)
  end
  
  def calculate_will
    self.send("#{will_save}_progression") + attribute_bonus(:wisdom)
  end
  
  def calculate_grapple
    calculate_base_attack + attribute_bonus(:strength)
  end

  private

  def initialize_hit_points
    self.hit_points = base_hit_points
    hit_points_per_level
  end

  def base_hit_points
    hit_die + attribute_bonus(:constitution)
  end

  def hit_points_rolled_dice
    @hit_points_rolled_dice ||= DiceRoller.new(:num_dice => level - 1, :sides => hit_die).rolled_dice
  end

  def hit_points_per_level
    (level - 1).times do |l| 
      self.hit_points += (hit_points_rolled_dice[l] + attribute_bonus(:constitution))
    end
  end

  # save progression methods
  def good_progression
    2 + level/2
  end

  def poor_progression
    level/3
  end
    
  # base attack progression methods
  def good_base_attack
    level
  end
  
  def average_base_attack
    (3 * level) / 4
  end
  
  def poor_base_attack
    level / 2
  end
end
