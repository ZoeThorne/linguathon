class Training < ApplicationRecord
	belongs_to :user
	has_many :training_words
	has_many :words, through: :training_words

	def filter_words(tier, topic, stages, word_types)

		# filter by stage
		
		word_filters = {}
		word_filters[:tier] = "foundation" if tier == "foundation"
		word_filters[:topic] = topic unless topic == "all"
		word_filters[:word_type] = word_types unless word_types == "all word types"  
		words_to_train = Word.where(word_filters).left_outer_joins(user_words: :user).where("user_words.user_id = ? OR user_words.user_id IS NULL", user.id)
		
		unless stages == "all stages"
			words_to_train = words_to_train.where(user_words: {stage: stages.to_i})
		end


		
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
