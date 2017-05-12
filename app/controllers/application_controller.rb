class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  
  before_action :authenticate_user!, except: [:index, :show, :about]

  private

  def user_not_authorized
    redirect_to root_path, notice: "You are not authorized to perform this action."
  end

end
