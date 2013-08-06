class Game < ActiveRecord::Base
  attr_accessible :title, :description, :body
  
  validates :title, :dungeon_master_id, :presence => true
  
  has_many :users, :through => :players
  has_many :players
  
  belongs_to :dungeon_master, :class_name => 'User'
end
