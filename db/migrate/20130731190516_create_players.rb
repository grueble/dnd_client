class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.belongs_to :user, :null => false
      t.belongs_to :game, :null => false
      t.timestamps
    end
  end
end
