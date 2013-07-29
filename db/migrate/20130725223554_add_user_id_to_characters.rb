class AddUserIdToCharacters < ActiveRecord::Migration
  def change
     add_column :characters, :user_id, :integer, :null => false
  end
end
