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
    	

    	user.streak_achievements(user)
    	user.words_achievements(user)
    

    end

    def streak_achievements(user)
    	streak = user.streak(:trainings)
    	if streak >= 1 && user.has_achievement?(user, "1st") == false
    		# new_achievements.push("1st")
    		new_a = user.user_achievements.create(achievement: Achievement.find_by(name: "1st"))
    		new_a.save

    	elsif streak >= 2 && user.has_achievement?(user, "2days") == false
    		new_a = user.user_achievements.create(achievement: Achievement.find_by(name: "2days"))
    		new_a.save
    	elsif streak >= 3 && user.has_achievement?(user, "3days") == false
    		new_a = user.user_achievements.create(achievement: Achievement.find_by(name: "3days"))
    		new_a.save
    	elsif streak >= 5 && user.has_achievement?(user, "5days") == false
    		new_a = user.user_achievements.create(achievement: Achievement.find_by(name: "5days"))
    		new_a.save
    	elsif streak >= 7 && user.has_achievement?(user, "7days") == false
    		new_a = user.user_achievements.create(achievement: Achievement.find_by(name: "7days"))
    		new_a.save
    	elsif streak >= 14 && user.has_achievement?(user, "2weeks") == false
    		new_a = user.user_achievements.create(achievement: Achievement.find_by(name: "2weeks"))
    		new_a.save
    	elsif streak >= 21 && user.has_achievement?(user, "3weeks") == false
    		new_a = user.user_achievements.create(achievement: Achievement.find_by(name: "3weeks"))
    		new_a.save
    	elsif streak >= 28 && user.has_achievement?(user, "1month") == false
    		new_a = user.user_achievements.create(achievement: Achievement.find_by(name: "1month"))
    		new_a.save
    	end
    end

    def words_achievements(user)
    	total_words = user.words.length

    	if total_words >= 10 && user.has_achievement?(user, "10words") == false
    		new_a = user.user_achievements.create(achievement: Achievement.find_by(name: "10words"))
    		new_a.save
    	elsif total_words >= 25 && user.has_achievement?(user, "25words") == false
    		new_a = user.user_achievements.create(achievement: Achievement.find_by(name: "25words"))
    		new_a.save
    	elsif total_words >= 50 && user.has_achievement?(user, "50words") == false
    		new_a = user.user_achievements.create(achievement: Achievement.find_by(name: "50words"))
    		new_a.save
    	elsif total_words >= 100 && user.has_achievement?(user, "100words") == false
    		new_a = user.user_achievements.create(achievement: Achievement.find_by(name: "100words"))
    		new_a.save
    	elsif total_words >= 250 && user.has_achievement?(user, "250words") == false
    		new_a = user.user_achievements.create(achievement: Achievement.find_by(name: "250words"))
    		new_a.save
    	elsif total_words >= 500 && user.has_achievement?(user, "500words") == false
    		new_a = user.user_achievements.create(achievement: Achievement.find_by(name: "500words"))
    		new_a.save
    	elsif total_words >= 1000 && user.has_achievement?(user, "1000words") == false
    		new_a = user.user_achievements.create(achievement: Achievement.find_by(name: "1000words"))
    		new_a.save
    	elsif total_words >= 1500 && user.has_achievement?(user, "1500words") == false
    		new_a = user.user_achievements.create(achievement: Achievement.find_by(name: "1500words"))
    		new_a.save	
    	end

    end
end
