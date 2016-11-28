class CreateTrainings < ActiveRecord::Migration[5.0]
  def change
    create_table :trainings do |t|
   		t.string :name, default: "Daily Training"
   		t.string :topic, default: "all"
   		t.string :tier, default: "higher"
   		t.string :language, default: "german"
      t.timestamps
    end
  end
end
