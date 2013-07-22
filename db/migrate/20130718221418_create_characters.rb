class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name, :null => false
      t.integer :level, :null => false
      t.integer :hit_points, :null => false
      t.integer :hit_die, :null => false
      t.integer :strength, :null => false
      t.integer :dexterity, :null => false
      t.integer :constitution, :null => false
      t.integer :intelligence, :null => false
      t.integer :wisdom, :null => false
      t.integer :charisma, :null => false
      t.string :base_atk_prog, :null => false
      t.string :fort_save_prog, :null => false
      t.string :reflex_save_prog, :null => false
      t.string :will_save_prog, :null => false

      t.timestamps
    end
  end
end
