class TrainingsController < ApplicationController

	def new
		@training = Training.new
	end

	def create
	    user = User.find_by(id: params[:user_id])
	    @tier = params[:tier]
	    @topic = params[:topic]
	    @stage = params[:stage]
	    @word_type = params[:word_type]
	    training = Training.new(user: current_user, topic: @topic, tier: @tier)
	    training.save
	    @words = training.filter_words(@tier, @topic, @stage, @word_type)
	    binding.pry
	    @words = @words.shuffle.first(10)
	    training.words = @words
	    
    # @words = 
    # training= Training.create(word: @words,user: current_user)

    #   if training
    #     render plain: "The training was created."
    #   else
    #     render plain: "We couldn't create the training."
    #   end 
    end

    def show
    	@user = current_user
    	@training = Training.find_by(id: params[:id])
    	@words = @training.training_words
    end

end
