class AddColumnsToUser < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :points, :integer, default: 0
  	add_column :users, :streak, :integer, default: 0
  	add_column :users, :language_studied, :string, default: "german"
  	add_column :users, :tier, :string, default: "higher"
  		
	end

end
