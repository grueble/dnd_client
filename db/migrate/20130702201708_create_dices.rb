class CreateDices < ActiveRecord::Migration
  def change
    create_table :die do |t|
      t.integer :sides, :null => false

      t.timestamps
    end
  end
end
