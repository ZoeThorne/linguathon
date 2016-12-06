class Achievement < ApplicationRecord
	has_many :user_achievements
    has_many :users, though: :user_achievements

    def has_achievement?(user, achievement)
    	check = user.achievements.find_by(name: achievement)
    	check == nil ? false : true
    end
    
end
