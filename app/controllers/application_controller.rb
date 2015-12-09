class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :mailbox, :conversation

  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordInvalid do
  flash[:warning] = 'Your message has not been sent. Please make sure no fields are left blank.'
  redirect_back_or root_path
  end

  def redirect_back_or(path)
    redirect_to request.referer || path
  end

  private

  def mailbox
    @mailbox ||= current_user.mailbox
  end

  def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  end

  protected

def configure_permitted_parameters
       devise_parameter_sanitizer.for(:sign_up) { |u| u.permit({ roles: [] }, :email, :password, :password_confirmation, 
      :name, :username, :bio, :location, :age, :food_choice, :interested_in, :avatar) }

    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, 
      :current_password, :name, :username, :bio, :location, :age, :food_choice, :interested_in, :avatar) }
  end
end
