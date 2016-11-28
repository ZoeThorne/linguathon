class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:show]

	def index

	end

	def show
		@user = User.find(params[:id])
		@words = @user.user_words
		@trainings = @user.trainings
		render :show
	end

end
