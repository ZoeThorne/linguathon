class TrainingsController < ApplicationController

	def new
		@training = Training.new
	end

	def create
	    user = User.find_by(id: params[:user_id])
	    @name = params[:name]
	    @tier = params[:tier]
	    @topic = params[:topic]
	    @stage = params[:stage]
	    @word_type = params[:word_type]

	    training = Training.new(user: current_user, topic: @topic, tier: @tier, name: @name)

	    @words = training.filter_words(@tier, @topic, @stage, @word_type)
	    	if @words.length < 10
	    		flash[:notice] = "There aren't enough words that fit your selection. Try a different combination."
    			redirect_to new_training_path
    		else
    			training.save
	    		@words = @words.shuffle
	    		@words = @words.take(10)
	    		training.words = @words
	    		redirect_to training_path(training)
	    	end
    end

    def show
    	@user = current_user
    	@training = Training.find_by(id: params[:id])
    	@words = @training.training_words
    	# @stages = @words.each do |word|
    	# 			word.stage_for_user
    	# 			end
    	# @stages = []
    	# @words.each do |word|
    	# 	this_word = @user.user_words.find_by_id(word.id)
  			# 	if this_word == nil
  			# 		stage = nil
  			# 	else
  			# 		stage = this_word.stage
  			# end
  			# @stages.push(stage)
  		# end
    end

    def train
    	@user = User.find_by(id: params[:user_id])
    	@training = Training.find_by(id: params[:id])
    	@words = @training.training_words
    	@words.each do |w|
    		this_word = @user.user_words.find_by(word_id: w.word_id)
    		unless this_word
    			new_word = @user.user_words.create(word: w.word, stage: 0)
				new_word.save
			end
		end
    end

    def my_api_method
    	render json: {result: "incorrect"}
    end


end
