class Training < ApplicationRecord
	belongs_to :user
	has_many :training_words
	has_many :words, through: :training_words

	def filter_words(tier, topic, stages, word_types)

		words_to_train = Word.all
		tier == "foundation" ? words_to_train = words_to_train.select {|w| w.tier == "foundation"} : words_to_train
		topic == "all" ? words_to_train : words_to_train = words_to_train.select {|w| w.topic == topic}
		# words_to_train.filter_stages(stages)
		word_types == "all word types" ? words_to_train : words_to_train = words_to_train.select {|w| w.word_type == word_types}
		return words_to_train

	end

	def filter_tier(tier)
		tier == "foundation" ? words_to_train = words_to_train.select {|w| w.tier == "foundation"} : words_to_train
	end

	def filter_topics(topic)
		topic == "all" ? words_to_train : words_to_train = words_to_train.select {|w| w.topic == topic}
	end

	# def filter_stages(stages)
	# 	case stages
	# 	when "unseen"
	# 		words_to_train = words_to_train.select {|w| w.stage == nil}
	# 	when "0"
	# 		words_to_train = words_to_train.select {|w| w.stage == 0}
	# 	when "1"
	# 		words_to_train = words_to_train.select {|w| w.stage == 1}
	# 	when "2"
	# 		words_to_train = words_to_train.select {|w| w.stage == 2}
	# 	when "3"
	# 		words_to_train = words_to_train.select {|w| w.stage == 3}
	# 	when "4"
	# 		words_to_train = words_to_train.select {|w| w.stage == 4}
	# 	else
	# 		words_to_train
	# 	end
	# end

	def filter_word_types(word_types)
		word_types == "all word types" ? words_to_train : words_to_train = words_to_train.select {|w| w.word_type == word_types}
	end

end
