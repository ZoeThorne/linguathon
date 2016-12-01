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
		# @guess = guess1
		render json: @word
		# render :json => {
  		#     		:word => @word,
  		#     		:guess => @guess
  		#  		}

	end

end
