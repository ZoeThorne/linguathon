class Achievement < ApplicationRecord
	has_many :user_achievements
    has_many :users, through: :user_achievements

    def has_achievement?(achievement)
    	check = user.achievements.find_by(name: achievement)
    	check == nil ? false : true
    end

    def self.check_achievements(user)
    	new_achievements = []

    	streak_achievements(user)
    	return new_achievements
    	binding.pry
    end

    def self.streak_achievements(user)
    	streak = user.streak(:trainings)
    	if streak >= 1 && user.has_achievement?("1st") == false
    		new_achievements.push("1st")
    	elsif streak >= 2 && user.has_achievement?("2days") == false
    		new_achievements.push("2days")
    	elsif streak >= 3 && user.has_achievement?("3days") == false
    		new_achievements.push("3days")
    	elsif streak >= 5 && user.has_achievement?("5days") == false
    		new_achievements.push("5days")
    	elsif streak >= 7 && user.has_achievement?("7days") == false
    		new_achievements.push("7days")
    	elsif streak >= 14 && user.has_achievement?("2weeks") == false
    		new_achievements.push("2weeks")
    	elsif streak >= 21 && user.has_achievement?("3weeks") == false
    		new_achievements.push("3weeks")
    	elsif streak >= 28 && user.has_achievement?("1month") == false
    		new_achievements.push("1month")
    	end
    end

end
