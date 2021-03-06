class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user, :logged_in?
  
  private
  
  def current_user
    @current_user ||= User.find_by_id(session[:current_user_id]) if session[:current_user_id]
  end
  
  def login_required
    unless logged_in?
      flash[:alert] = "You must be logged in to perform this action"
      redirect_to login_path
    end
  end
  
  def logged_in?
    current_user.present?
  end
  
  def logout_required
    if logged_in?
      flash[:alert] = "You must be logged out to perform this action"
      redirect_to root_url
    end
  end
  
  def sign_in(user)
    session[:current_user_id] = user.id
  end
  
  def load_game
    @game = Game.find(params[:game_id])
  end
end
