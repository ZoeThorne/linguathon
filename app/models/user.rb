class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true

  has_many :user_words
  has_many :words, through: :user_words
  has_many :trainings

  has_many :user_achievements
  has_many :achievements, through: :user_achievements

  has_streak

    def has_achievement?(user, achievement)
    	check = user.achievements.find_by(name: achievement)
    	if check == nil
    		return false
    	else
    		return true
    	end

    end

    def check_achievements(user)
    	new_achievements = []

    	user.streak_achievements(user)
    	
    

    end

    def streak_achievements(user)
    	streak = user.streak(:trainings)
    	if streak >= 1 && user.has_achievement?(user, "1st") == false
    		# new_achievements.push("1st")
    		new_a = user.user_achievements.create(achievement: Achievement.find_by(name: "1st"))
    		new_a.save

    	elsif streak >= 2 && user.has_achievement?(user, "2days") == false
    		new_achievements.push("2days")
    	elsif streak >= 3 && user.has_achievement?(user, "3days") == false
    		new_achievements.push("3days")
    	elsif streak >= 5 && user.has_achievement?(user, "5days") == false
    		new_achievements.push("5days")
    	elsif streak >= 7 && user.has_achievement?(user, "7days") == false
    		new_achievements.push("7days")
    	elsif streak >= 14 && user.has_achievement?(user, "2weeks") == false
    		new_achievements.push("2weeks")
    	elsif streak >= 21 && user.has_achievement?(user, "3weeks") == false
    		new_achievements.push("3weeks")
    	elsif streak >= 28 && user.has_achievement?(user, "1month") == false
    		new_achievements.push("1month")
    	end
    end
end
