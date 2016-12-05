class ApiWordsController < ApplicationController

		# protect_from_forgery_with: :null_session

	def get_words
		@user = current_user
		@training = Training.find_by(id: params[:id])
		@words = @training.words
		render json: @words
	end

	def check
		@user = current_user
		@training = Training.find_by(id: params[:training_id])
		@word = Word.find_by(id: params[:word_id])
		guess = params[:guess]

		if guess == @word.tl
			this_word = @user.user_words.find_by(word_id: @word.id)
			if this_word == nil
				new_word = @user.user_words.create(word: @word, stage: 1)
				new_word.save
			else
				
				unless this_word.stage == 5
					this_word.update_attributes(:stage => this_word.stage + 1)
				end
			end
			this_training_word = @training.training_words.find_by(word_id: @word.id)
			this_training_word.update_attributes(:result => true)
			extra_points = @word.calculate_points(@word)
			binding.pry
			@user.update_attribute(:points, @user.points + extra_points)
			binding.pry
			render json: {status: "correct"}
		else
			this_word = @user.user_words.find_by(word_id: @word.id)
			if this_word == nil
				new_word = @user.user_words.create(word: @word, stage: 0)
				new_word.save
			end
			this_training_word = @training.training_words.find_by(word_id: @word.id)
			this_training_word.update_attributes(:result => false)
			render json: {status: "incorrect", tl: @word.tl}
		end
		

	end

	def get_results
		@user = current_user
		@training = Training.find_by(id: params[:id])
		@words = @training.words
		@training_words = @training.training_words
		render json: @training_words.to_json(:include => :word)

	end

end
