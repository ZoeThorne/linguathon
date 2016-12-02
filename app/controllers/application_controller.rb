class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception 
  protect_from_forgery unless: -> { request.format.json? }
  before_action :configure_permitted_parameters, if: :devise_controller?

  # helper_method :current_user

  # def current_user
  # 	if @current_user.nil?
  # 		@current_user = User.find_by(id: session[:user_id])
  # 	end

  # 	@current_user
  # end

  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
