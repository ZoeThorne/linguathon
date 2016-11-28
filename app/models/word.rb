class Word < ApplicationRecord
	has_many :user_words
  	has_many :users, through: :user_words
  	has_many :trainings, through: :training_words
end
