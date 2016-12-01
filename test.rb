if stages == "all stages"
	words_to_train = Word.all
else if stages == "unseen"
	# Only words that aren't in user_words / have nil in user_words?
	possible_words = Word.all
	my_words = user.user_words
	words_to_train = ????
	my_words.each do |word|
		possible_words.each do |w|
			
		end
	end

else if stages == "0"
	my_words = user.user_words
	words_to_train = my_words.select {|w| w.stage == 0}
	# Only words with stage zero
	# etc for 1-4
end

# Then complete rest of filters

	my_words = user.user_words
	words_to_train = my_words.select {|w| w.stage == stage.to_i}
