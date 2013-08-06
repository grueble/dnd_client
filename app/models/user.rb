class User < ActiveRecord::Base
  attr_accessible :username, :password, :password_confirmation
  
  validates :username, :presence => true, :uniqueness => true, :length => { maximum: 50 }
  validates :password, :presence => true
  
  has_secure_password
  
  has_many :characters
  has_many :games, :through => :players
  has_many :players
  
  has_many :campaigns, :class_name => 'Game', :foreign_key => "dungeon_master_id"
  
  scope :uninvited_for, lambda { |game|
    user_ids = game.user_ids << game.dungeon_master_id
    where("users.id NOT IN (?)", user_ids)
  }

  def to_s
    username
  end
end