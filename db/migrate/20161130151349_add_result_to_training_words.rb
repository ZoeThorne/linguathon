class AddResultToTrainingWords < ActiveRecord::Migration[5.0]
  def change
    add_column :training_words, :result, :boolean
  end
end
