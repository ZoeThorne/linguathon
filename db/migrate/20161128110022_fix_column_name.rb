class FixColumnName < ActiveRecord::Migration[5.0]
  def change
  	rename_column :words, :type, :word_type
  end
end
