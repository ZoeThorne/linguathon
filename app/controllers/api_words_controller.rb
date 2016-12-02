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
			render json: {status: "correct"}
		else
			render json: {status: "incorrect", tl: @word.tl}
		end
		

	end

end
