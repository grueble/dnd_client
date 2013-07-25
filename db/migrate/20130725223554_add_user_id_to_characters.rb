class AddUserIdToCharacters < ActiveRecord::Migration
  def change
     add_column :characters, :user_id, :string, :null => false
  end
end
