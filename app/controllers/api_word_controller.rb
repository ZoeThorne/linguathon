class ApiWordController < ApplicationController
	protect_from_forgery_with: :null_session

	def get_words
		@user = current_user
		@training = Training.find_by(id: params[:id])
		@words = @training.words
		binding.pry
		render json: @words
	end

	def check
	end

end
