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

  after_create :send_welcome_email


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
    	user.topic_achievements(user)
    	user.misc_achievements(user)
    

    end

    def streak_achievements(user)
    	streak = user.streak(:trainings)
    	if streak
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
    	elsif total_words >= 1600 && user.has_achievement?(user, "allwords") == false
    		new_a = user.user_achievements.create(achievement: Achievement.find_by(name: "allwords"))
    		new_a.save
    	end

    end

    def topic_achievements(user)
    	if user.words.where(topic: "key words").length == 226 && user.has_achievement?(user, "keywords") == false
    		new_a = user.user_achievements.create(achievement: Achievement.find_by(name: "keywords"))
    		new_a.save
    		if user.has_achievement?(user, "completetopic") == false
    			new_a = user.user_achievements.create(achievement: Achievement.find_by(name: "completetopic"))
    			new_a.save
    		end
    	elsif user.words.where(topic: "connectives").length == 42 && user.has_achievement?(user, "connectives") == false
    		new_a = user.user_achievements.create(achievement: Achievement.find_by(name: "connectives"))
    		new_a.save
    		if user.has_achievement?(user, "completetopic") == false
    			new_a = user.user_achievements.create(achievement: Achievement.find_by(name: "completetopic"))
    			new_a.save
    		end
    	elsif user.words.where(topic: "prepositions").length == 17 && user.has_achievement?(user, "prepositions") == false
    		new_a = user.user_achievements.create(achievement: Achievement.find_by(name: "prepositions"))
    		new_a.save
    		if user.has_achievement?(user, "completetopic") == false
    			new_a = user.user_achievements.create(achievement: Achievement.find_by(name: "completetopic"))
    			new_a.save
    		end
    	elsif user.words.where(topic: "opinions").length == 77 && user.has_achievement?(user, "opinions") == false
    		new_a = user.user_achievements.create(achievement: Achievement.find_by(name: "opinions"))
    		new_a.save
    		if user.has_achievement?(user, "completetopic") == false
    			new_a = user.user_achievements.create(achievement: Achievement.find_by(name: "completetopic"))
    			new_a.save
    		end
    	elsif user.words.where(topic: "travel and tourism").length == 169 && user.has_achievement?(user, "travel") == false
    		new_a = user.user_achievements.create(achievement: Achievement.find_by(name: "travel"))
    		new_a.save
    		if user.has_achievement?(user, "completetopic") == false
    			new_a = user.user_achievements.create(achievement: Achievement.find_by(name: "completetopic"))
    			new_a.save
    		end
    	elsif user.words.where(topic: "home and local area").length == 205 && user.has_achievement?(user, "home") == false
    		new_a = user.user_achievements.create(achievement: Achievement.find_by(name: "home"))
    		new_a.save
    		if user.has_achievement?(user, "completetopic") == false
    			new_a = user.user_achievements.create(achievement: Achievement.find_by(name: "completetopic"))
    			new_a.save
    		end
    	elsif user.words.where(topic: "me, my family and friends").length == 147 && user.has_achievement?(user, "me") == false
    		new_a = user.user_achievements.create(achievement: Achievement.find_by(name: "me"))
    		new_a.save
    		if user.has_achievement?(user, "completetopic") == false
    			new_a = user.user_achievements.create(achievement: Achievement.find_by(name: "completetopic"))
    			new_a.save
    		end
    	elsif user.words.where(topic: "technology").length == 45 && user.has_achievement?(user, "technology") == false
    		new_a = user.user_achievements.create(achievement: Achievement.find_by(name: "technology"))
    		new_a.save
    		if user.has_achievement?(user, "completetopic") == false
    			new_a = user.user_achievements.create(achievement: Achievement.find_by(name: "completetopic"))
    			new_a.save
    		end
    	elsif user.words.where(topic: "leisure").length == 192 && user.has_achievement?(user, "leisure") == false
    		new_a = user.user_achievements.create(achievement: Achievement.find_by(name: "leisure"))
    		new_a.save
    		if user.has_achievement?(user, "completetopic") == false
    			new_a = user.user_achievements.create(achievement: Achievement.find_by(name: "completetopic"))
    			new_a.save
    		end
    	elsif user.words.where(topic: "festivals").length == 47 && user.has_achievement?(user, "festivals") == false
    		new_a = user.user_achievements.create(achievement: Achievement.find_by(name: "festivals"))
    		new_a.save
    		if user.has_achievement?(user, "completetopic") == false
    			new_a = user.user_achievements.create(achievement: Achievement.find_by(name: "completetopic"))
    			new_a.save
    		end
    	elsif user.words.where(topic: "health and social issues").length == 108 && user.has_achievement?(user, "health") == false
    		new_a = user.user_achievements.create(achievement: Achievement.find_by(name: "health"))
    		new_a.save
    		if user.has_achievement?(user, "completetopic") == false
    			new_a = user.user_achievements.create(achievement: Achievement.find_by(name: "completetopic"))
    			new_a.save
    		end
    	elsif user.words.where(topic: "global issues").length == 226 && user.has_achievement?(user, "global") == false
    		new_a = user.user_achievements.create(achievement: Achievement.find_by(name: "global"))
    		new_a.save
    		if user.has_achievement?(user, "completetopic") == false
    			new_a = user.user_achievements.create(achievement: Achievement.find_by(name: "completetopic"))
    			new_a.save
    		end
    	elsif user.words.where(topic: "education").length == 160 && user.has_achievement?(user, "education") == false
    		new_a = user.user_achievements.create(achievement: Achievement.find_by(name: "education"))
    		new_a.save
    		if user.has_achievement?(user, "completetopic") == false
    			new_a = user.user_achievements.create(achievement: Achievement.find_by(name: "completetopic"))
    			new_a.save
    		end
    	elsif user.words.where(topic: "work").length == 226 && user.has_achievement?(user, "work") == false
    		new_a = user.user_achievements.create(achievement: Achievement.find_by(name: "work"))
    		new_a.save
    		if user.has_achievement?(user, "completetopic") == false
    			new_a = user.user_achievements.create(achievement: Achievement.find_by(name: "completetopic"))
    			new_a.save
    		end
    	elsif user.words.where(tier: "foundation").length == 1412 && user.has_achievement?(user, "allfoundation") == false
    		new_a = user.user_achievements.create(achievement: Achievement.find_by(name: "allfoundation"))
    		new_a.save
    		if user.has_achievement?(user, "completetopic") == false
    			new_a = user.user_achievements.create(achievement: Achievement.find_by(name: "completetopic"))
    			new_a.save
    		end
    	end
    end

    def misc_achievements(user)
    	if user.user_words.find_by(stage: 2) != nil && user.has_achievement?(user, "stage2") == false
    		new_a = user.user_achievements.create(achievement: Achievement.find_by(name: "stage2"))
    		new_a.save
    	elsif user.user_words.find_by(stage: 5) != nil && user.has_achievement?(user, "stage5") == false
    		new_a = user.user_achievements.create(achievement: Achievement.find_by(name: "stage5"))
    		new_a.save
    	end
    end

  private

    def send_welcome_email
      WelcomeMailer.welcome_email(self).deliver_now
    end

end
