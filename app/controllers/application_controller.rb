class ApplicationController < ActionController::Base
  include Authentication
  protect_from_forgery
  
  private 
  def user_required
    unless current_user
      flash[:error] = "You must be logged in."
      redirect_to "/"
    end
  end
end
