class CreateDiceRollers < ActiveRecord::Migration
  def change
    create_table :dice_rollers do |t|
      t.integer :num_dice, :null => false
      t.integer :sides, :null => false

      t.timestamps
    end
  end
end
