class Character < ActiveRecord::Base
  attr_accessible :name, :level, :hit_points, :hit_die, :strength, :dexterity, 
                  :constitution, :intelligence, :wisdom, :charisma, 
                  :base_atk_progression, :fortitude_save_progression, 
                  :reflex_save_progression, :will_save_progression
                  
  validates :name, :level, :hit_points, :hit_die, :strength, :dexterity, :constitution, 
            :intelligence, :wisdom, :charisma, :base_atk_progression, :fortitude_save_progression, 
            :reflex_save_progression, :will_save_progression, :presence => true
            
  validates :level, :hit_points, :hit_die, :strength, :dexterity, :constitution,
            :intelligence, :wisdom, :charisma, :numericality => { :only_integer => true }
            
  before_validation :initialize_hit_points, :on => :create
  
  BASE_ATK = [ 'good', 'average', 'poor' ]
  
  FORT_SAVE = [ 'good', 'poor' ]
  
  REFLEX_SAVE = [ 'good', 'poor' ]
  
  WILL_SAVE = [ 'good', 'poor' ]
  
  def attribute_bonus(attribute)
    (self.send(attribute) - 10) / 2
  end
  
  def calculate_base_atk
    if base_atk_progression == 'good'
      good_base_atk
    elsif base_atk_progression == 'average'
      average_base_atk
    else
      poor_base_atk
    end
  end
  
  def calculate_fortitude
    if fortitude_save_progression == 'good'
      good_save_progression + attribute_bonus(:constitution)
    else
      poor_save_progression + attribute_bonus(:constitution)
    end
  end
  
  def calculate_reflex
    if reflex_save_progression == 'good'
      good_save_progression + attribute_bonus(:dexterity)
    else
      poor_save_progression + attribute_bonus(:dexterity)
    end
  end
  
  def calculate_will
    if will_save_progression == 'good'
      good_save_progression + attribute_bonus(:wisdom)
    else
      poor_save_progression + attribute_bonus(:wisdom)
    end
  end
  
  def calculate_grapple
    calculate_base_atk + attribute_bonus(:strength)
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

  def good_save_progression
    2 + level/2
  end
  
  def poor_save_progression
    level/3
  end
    
  def good_base_atk
    level
  end
  
  def average_base_atk
    (3 * level) / 4
  end
  
  def poor_base_atk
    level / 2
  end
end
