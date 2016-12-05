class Word < ApplicationRecord
	has_many :user_words
  	has_many :users, through: :user_words
  	has_many :training_words
  	has_many :trainings, through: :training_words

  	def stage_for_user(user, word)
  		this_word = user.user_words.find_by_id(word.id)
  		if this_word == nil
  			stage = nil
  		else
  			stage = this_word.stage
  		end
  		return stage
  	end

  	def calculate_points(word)
  		time = Time.now
  		if time.wday == 0 && word.topic == "leisure"
  			points = 3
  		elsif time.wday == 1 && word.topic == "key words"
  			points = 3
  		elsif time.wday == 2 && word.word_type == "verb"
  			points = 3
  		elsif time.wday == 3 && word.word_type == "noun"
  			points = 3
  		elsif time.wday == 4 && word.topic == "education"
  			points = 3
  		elsif time.wday == 5 && word.topic == "me, my family and friends"
  			points = 3
  		elsif time.wday == 6 && word.topic == "home and local area"
  			points = 3
  		else
  			points = 1
  		end

  		return points				
  			
  	end

end
