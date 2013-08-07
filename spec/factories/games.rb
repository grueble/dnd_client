# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :game do
    sequence (:title) {|n| "game #{n}"}
    description 'a generic game'
    body 'insert game content here'
    association :dungeon_master, :factory => :user
  end
end
