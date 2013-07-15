class AddDiceRollerIdToDice < ActiveRecord::Migration
  def change
    add_column :die, :dice_roller_id, :integer, :null => false
  end
end
