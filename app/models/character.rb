class Character < ActiveRecord::Base
  attr_accessible :name, :level, :hit_points, :hit_die, :strength, :dexterity, 
                  :constitution, :intelligence, :wisdom, :charisma, :base_atk_prog, 
                  :fort_save_prog, :reflex_save_prog, :will_save_prog
                  
  validates :name, :level, :hit_points, :hit_die, :strength, :dexterity, :constitution, 
            :intelligence, :wisdom, :charisma, :base_atk_prog, :fort_save_prog, 
            :reflex_save_prog, :will_save_prog, :presence => true
  validates :level, :hit_points, :hit_die, :strength, :dexterity, :constitution,
            :intelligence, :wisdom, :charisma, :numericality => { :only_integer => true }
            
  before_save :hit_points
  
  BASE_ATK = [ 'good', 'average', 'poor' ]
  
  FORT_SAVE = [ 'good', 'poor' ]
  
  REFLEX_SAVE = [ 'good', 'poor' ]
  
  WILL_SAVE = [ 'good', 'poor' ]
  
  def base_atk_options
    BASE_ATK
  end
  
  def fort_save_options
    FORT_SAVE
  end
  
  def reflex_save_options
    REFLEX_SAVE
  end
  
  def will_save_options
    WILL_SAVE
  end
  
  def initialize_hit_points
    hit_points = (hit_die + attribute_bonus(constitution))
    dice_roller = DiceRoller.new(:num_dice => level - 1, :sides => hit_die)
    dice_rolls = dice_roller.rolled_dice
    (level - 1).times do |l| 
      hit_points += (dice_rolls[l] + attribute_bonus(constitution))
    end
    hit_points
  end
  
  def attribute_bonus(attribute)
    (attribute - 10) / 2
  end
  
  def calculate_base_atk
    if base_atk_prog == 'good'
      good_base_atk
    elsif base_atk_prog == 'average'
      average_base_atk
    else
      poor_base_atk
    end
  end
  
  def calculate_fortitude
    if fort_save_prog == 'good'
      good_save_progression + attribute_bonus(constitution)
    else
      poor_save_progression + attribute_bonus(constitution)
    end
  end
  
  def calculate_reflex
    if reflex_save_prog == 'good'
      good_save_progression + attribute_bonus(dexterity)
    else
      poor_save_progression + attribute_bonus(dexterity)
    end
  end
  
  def calculate_will
    if will_save_prog == 'good'
      good_save_progression + attribute_bonus(wisdom)
    else
      poor_save_progression + attribute_bonus(wisdom)
    end
  end
  
  def calculate_grapple
    calculate_base_atk + attribute_bonus(strength)
  end
  
  def good_save_progression
    case level
    when 1
      2
    when 2, 3
      3
    when 4, 5 
      4
    when 6, 7
      5
    when 8, 9
      6
    when 10, 11
      7
    when 12, 13
      8
    when 14, 15
      9
    when 16, 17
      10
    when 18, 19
      11
    when 20
      12
    end
  end
  
  def poor_save_progression
    case level
    when 1, 2
      0
    when 3, 4, 5
      1
    when 6, 7, 8
      2
    when 9, 10, 11
      3
    when 12, 13, 14
      4
    when 15, 16, 17
      5
    when 18, 19, 20
      6
    end
  end
    
  def good_base_atk
    level
  end
  
  def average_base_atk
    case level
    when 1
      0
    when 2
      1
    when 3
      2
    when 4, 5
      3
    when 6
      4
    when 7
      5
    when 8, 9
      6
    when 10
      7
    when 11
      8
    when 12, 13
      9
    when 14
      10
    when 15
      11
    when 16, 17
      12
    when 18
      13
    when 19
      14
    when 20
      15
    end
  end
  
  def poor_base_atk
    case level
    when 1
      0
    when 2, 3
      1
    when 4, 5
      2
    when 6, 7
      3
    when 8, 9
      4
    when 10, 11
      5
    when 12, 13
      6
    when 14, 15
      7
    when 16, 17
      8
    when 18, 19
      9
    when 20
      10
    end
  end
end
