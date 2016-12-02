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
end
