# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :character do
    name 'Drizzt'
    level 1
    hit_points 8
    hit_die 8
    strength 14
    dexterity 18
    constitution 11
    intelligence 13
    wisdom 12
    charisma 17
    base_atk_prog 'good'
    fort_save_prog 'good'
    reflex_save_prog 'good'
    will_save_prog 'poor'
  end
end
