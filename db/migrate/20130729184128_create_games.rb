class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title, :null => false
      t.string :description
      t.string :body
      t.integer :dungeon_master_id, :null => false

      t.timestamps
    end
  end
end
