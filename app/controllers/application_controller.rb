class ApplicationController < ActionController::Base

  before_action :user_auth

  def user_auth
    if session[:id]
      @current_user ||= User.find_by(id: session[:id])
    end
  end

end
