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

    def has_achievement?(achievement)
    	achievements.find_by(name: achievement)
    end

    def award_achievement(achievement)
    	new_a = user_achievements.create(achievement: Achievement.find_by(name: achievement))
    	new_a.save
    end

    def check_achievements
    	streak_achievements
    	words_achievements
    	topic_achievements
    	misc_achievements
    	one_of_each
    end

    def streak_achievements
    	streak = streak(:trainings)
    	if streak
	    	if streak >= 1 && !has_achievement?("1st")
	    		# new_achievements.push("1st")
	    		award_achievement("1st")
	    	elsif streak >= 2 && !has_achievement?("2days")
	    		award_achievement("2days")
	    	elsif streak >= 3 && !has_achievement?("3days")
	    		award_achievement("3days")
	    	elsif streak >= 5 && !has_achievement?("5days")
	    		award_achievement("5days")
	    	elsif streak >= 7 && !has_achievement?("7days")
	    		award_achievement("7days")
	    	elsif streak >= 14 && !has_achievement?("2weeks")
	    		award_achievement("2weeks")
	    	elsif streak >= 21 && !has_achievement?("3weeks")
	    		award_achievement("3weeks")
	    	elsif streak >= 28 && !has_achievement?("1month")
	    		award_achievement("1month")
	    	end
	    end
    end

    def words_achievements
    	total_words = words.length

    	if total_words >= 10 && !has_achievement?("10words")
    		award_achievement("10words")
    	elsif total_words >= 25 && !has_achievement?("25words")
    		award_achievement("25words")
    	elsif total_words >= 50 && !has_achievement?("50words")
    		award_achievement("50words")
    	elsif total_words >= 100 && !has_achievement?("100words")
    		award_achievement("100words")
    	elsif total_words >= 250 && !has_achievement?("250words")
    		award_achievement("250words")
    	elsif total_words >= 500 && !has_achievement?("500words")
    		award_achievement("500words")
    	elsif total_words >= 1000 && !has_achievement?("1000words")
    		award_achievement("1000words")
    	elsif total_words >= 1500 && !has_achievement?("1500words")
    		award_achievement("1500words")	
    	elsif total_words >= 1600 && !has_achievement?("allwords")
    		award_achievement("allwords")
    	end

    end

    def topic_achievements
    	if words.where(topic: "key words").length == 226 && !has_achievement?("keywords")
    		award_achievement("keywords")
    		if !has_achievement?("completetopic")
    			award_achievement("completetopic")
    		end
    	elsif words.where(topic: "connectives").length == 42 && !has_achievement?("connectives")
    		award_achievement("connectives")
    		if !has_achievement?("completetopic")
    			award_achievement("completetopic")
    		end
    	elsif words.where(topic: "prepositions").length == 17 && !has_achievement?("prepositions")
    		award_achievement("prepositions")
    		if !has_achievement?("completetopic")
    			award_achievement("completetopic")
    		end
    	elsif words.where(topic: "opinions").length == 77 && !has_achievement?("opinions")
    		award_achievement("opinions")
    		if !has_achievement?("completetopic")
    			award_achievement("completetopic")
    		end
    	elsif words.where(topic: "travel and tourism").length == 169 && !has_achievement?("travel")
    		award_achievement("travel")
    		if !has_achievement?("completetopic")
    			award_achievement("completetopic")
    		end
    	elsif words.where(topic: "home and local area").length == 205 && !has_achievement?("home")
    		award_achievement("home")
    		if !has_achievement?("completetopic")
    			award_achievement("completetopic")
    		end
    	elsif words.where(topic: "me, my family and friends").length == 147 && !has_achievement?("me")
    		award_achievement("me")
    		if !has_achievement?("completetopic")
    			award_achievement("completetopic")
    		end
    	elsif words.where(topic: "technology").length == 45 && !has_achievement?("technology")
    		award_achievement("technology")
    		if !has_achievement?("completetopic")
    			award_achievement("completetopic")
    		end
    	elsif words.where(topic: "leisure").length == 192 && !has_achievement?("leisure")
    		award_achievement("leisure")
    		if !has_achievement?("completetopic")
    			award_achievement("completetopic")
    		end
    	elsif words.where(topic: "festivals").length == 47 && !has_achievement?("festivals")
    		award_achievement("festivals")
    		if !has_achievement?("completetopic")
    			award_achievement("completetopic")
    		end
    	elsif words.where(topic: "health and social issues").length == 108 && !has_achievement?("health")
    		award_achievement("health")
    		if !has_achievement?("completetopic")
    			award_achievement("completetopic")
    		end
    	elsif words.where(topic: "global issues").length == 226 && !has_achievement?("global")
    		award_achievement("global")
    		if !has_achievement?("completetopic")
    			award_achievement("completetopic")
    		end
    	elsif words.where(topic: "education").length == 160 && !has_achievement?("education")
    		award_achievement("education")
    		if !has_achievement?("completetopic")
    			award_achievement("completetopic")
    		end
    	elsif words.where(topic: "work").length == 226 && !has_achievement?("work")
    		award_achievement("work")
    		if !has_achievement?("completetopic")
    			award_achievement("completetopic")
    		end
    	elsif words.where(tier: "foundation").length == 1412 && !has_achievement?("allfoundation")
    		award_achievement("allfoundation")
    		if !has_achievement?("completetopic")
    			award_achievement("completetopic")
    		end
    	end
    end

    def misc_achievements
    	if user_words.find_by(stage: 2) != nil && !has_achievement?("stage2")
    		award_achievement("stage2")
    	elsif user_words.find_by(stage: 5) != nil && !has_achievement?("stage5")
    		award_achievement("stage5")
    	end
    end

    def one_of_each
    	all_topics = Word.select(:topic).uniq.order(:topic).map(&:topic)
    	user_topics = words.select(:topic).uniq.order(:topic).map(&:topic)
    	
    	if all_topics == user_topics && !has_achievement?("1ofeach")
    		award_achievement("1ofeach")
    	end
    end

  private

    def send_welcome_email
      WelcomeMailer.welcome_email(self).deliver_now
    end

end
