class ApplicationController < ActionController::Base
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def after_sign_in_path_for(resource)
    user_path(current_user)
    
    @range = params[:range]

    # if @range == "User"
    #   @users = User.looks(params[:search], params[:word])
    # else
    #   @books = Book.looks(params[:search], params[:word])
    # end
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
