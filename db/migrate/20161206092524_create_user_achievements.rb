class CreateUserAchievements < ActiveRecord::Migration[5.0]
  def change
    create_table :user_achievements do |t|
      t.references :achievement, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
