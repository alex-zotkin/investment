require 'digest'

class AuthController < ApplicationController
  cur_user = nil

  def register

    @user = User.new

    if session[:id]
      redirect_to '/investment'
    end

  end


  def create
    @user = User.new(name: params[:name],
                     lastname: params[:lastname],
                     email: params[:email],
                     password: Digest::MD5.hexdigest(params[:pass]),
                     img: "https://i.gifer.com/2GU.gif")

    if @user.save
      session[:id] = @user.id
      redirect_to '/investment'
    else
      render template: 'auth/register';
    end
  end

  #Страница входа Digest::MD5.hexdigest(
  def login
    if session[:id]
      redirect_to '/investment'
    end

    unless params[:email].nil?
      user = User.find_by(email: params[:email])
      if user.nil?
        @err = 'Пользователя с таким email не существует'
        return
      end
      if user[:password] != Digest::MD5.hexdigest(params[:pass])
        @err = 'Неправильное имя / пароль'
        return
      end


      session[:id] = user[:id]

      redirect_to '/investment'

    end
  end


  def logout
    session.delete(:id)
    redirect_to '/'
  end
end