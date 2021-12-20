class ProfileController < ApplicationController
  def index
    unless @current_user
      redirect_to :login
    end
  end


  def save
    @current_user[:img] = params[:img] unless params[:img].empty?
    @current_user[:name] = params[:name] unless params[:name].empty?
    @current_user[:lastname] = params[:lastname] unless params[:lastname].empty?
    @current_user.save

    redirect_to :investment
  end
end