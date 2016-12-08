class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:show]
	 # after_action :send_welcome_email, only: [:create]
	

	def index
		unless current_user.nil?
			redirect_to user_path(current_user)
		end
	end

	def show
		@user = current_user
		@user.check_achievements
		@words = @user.user_words
		@recent_words = @words.order("created_at DESC").limit(15)
		@best_words = @words.order("stage DESC").limit(15)
		@worst_words = @words.order("stage ASC").limit(15)

		@best_topics = @best_words.limit(3).map do |bw|
							bw.word.topic
						end
		@best_topics = @best_topics.uniq

		@worst_topics = @worst_words.limit(3).map do |ww|
							ww.word.topic
						end
		@worst_topics = @worst_topics.uniq

		@best_word_types = @best_words.limit(2).map do |b|
							b.word.word_type
						end
		@best_word_types = @best_word_types.uniq

		@worst_word_types = @worst_words.limit(2).map do |w|
							w.word.word_type
						end
		@worst_word_types = @worst_word_types.uniq

		@trainings = @user.trainings.order("updated_at DESC").limit(15)
		render :show

		
		@achievements = @user.achievements

	end

	   #  private

    # def send_welcome_email
    #   WelcomeMailer.welcome_email(resource).deliver_now
    #   puts "Email sent"
    # end

end
