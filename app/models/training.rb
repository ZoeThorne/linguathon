class Training < ApplicationRecord
	belongs_to :user
	has_many :training_words
	has_many :words, through: :training_words
end
