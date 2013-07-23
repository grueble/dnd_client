# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :character do
    name 'Drizzt'
    level 1
    hit_die 8
    strength 14
    dexterity 18
    constitution 8
    intelligence 13
    wisdom 11
    charisma 17
    base_attack_progression 'good'
    fortitude_save_progression 'good'
    reflex_save_progression 'good'
    will_save_progression 'poor'
  end
end
