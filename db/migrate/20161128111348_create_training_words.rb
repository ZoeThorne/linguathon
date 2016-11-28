class CreateTrainingWords < ActiveRecord::Migration[5.0]
  def change
    create_table :training_words do |t|
      t.references :training, foreign_key: true
      t.references :word, foreign_key: true

      t.timestamps
    end
  end
end
