class Player < ActiveRecord::Base
  attr_accessible :game_id, :user_id
  
  validates :user_id, :game_id, :presence => true
  validates :user_id, :uniqueness => { :scope => :game_id }
  
  validate :player_is_not_dungeon_master
  
  belongs_to :user
  belongs_to :game
  
  private
  
  def player_is_not_dungeon_master
    if game && game.dungeon_master_id == user_id 
      errors.add(:player, "must not be the game's DM")
    end
  end
end
