class Training < ApplicationRecord
	belongs_to :user
	has_many :words, through: :training_words
end
