class CreateWords < ActiveRecord::Migration[5.0]
  def change
    create_table :words do |t|
      t.string :english
      t.string :tl
      t.string :language, default: "german"
      t.string :topic
      t.string :type
      t.string :tier

      t.timestamps
    end
  end
end
