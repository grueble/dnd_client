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
    fortitude_save 'good'
    reflex_save 'good'
    will_save 'poor'
  end
end
