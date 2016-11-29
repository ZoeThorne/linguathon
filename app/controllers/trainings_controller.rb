class TrainingsController < ApplicationController

	def new
		@training = Training.new
	end

	def create
    user = User.find_by(id: params[:user_id])
    @topic = params[:topic]
    @stage = params[:stage]
    @word_type = params[:word_type]
    binding.pry
    # @words = 
    # training= Training.create(word: @words,user: current_user)

    #   if training
    #     render plain: "The training was created."
    #   else
    #     render plain: "We couldn't create the training."
    #   end 
    end

end
