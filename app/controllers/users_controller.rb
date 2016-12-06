class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:show]

	def index

	end

	def show
		@user = User.find(params[:id])
		@words = @user.user_words
		@recent_words = @words.order("created_at DESC").limit(15)
		@best_words = @words.order("stage DESC").limit(15)
		@worst_words = @words.order("stage ASC").limit(15)

		@best_topics = @best_words.limit(3).each do |bw|
							bw.word.topic
						end
		@best_topics = @best_topics.uniq

		@worst_topics = @worst_words.limit(3).each do |ww|
							ww.word.topic
						end
		@worst_topics = @worst_topics.uniq

		@best_word_types = @best_words.limit(2).each do |b|
							b.word.word_type
						end
		@best_word_types = @best_word_types.uniq

		@worst_word_types = @worst_words.limit(2).each do |w|
							w.word.word_type
						end
		@worst_word_types = @worst_word_types.uniq

		@trainings = @user.trainings.order("updated_at DESC").limit(15)
		render :show

		@achievements = @user.achievements
		
	end

end
