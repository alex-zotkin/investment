require 'digest'

class AuthController < ApplicationController
  def register

    if cookies[:name]
      redirect_to '/investment'
    end

    @user = User.new(name: params[:name],
                      lastname: params[:lastname],
                      email: params[:email],
                      password: params[:pass])

    if @user.save
      cookies[:name] = @user[:name] + " " + @user[:lastname]
      cookies[:email] = @user[:email]
      cookies[:pass] = @user[:password]
      redirect_to '/investment'
    end
  end


  #Страница входа Digest::MD5.hexdigest(
  def login
    if cookies[:name]
      redirect_to '/investment'
    end

    unless params[:email].nil?
      user = User.find_by(email: params[:email])
      if user.nil?
        @err = 'Пользователя с таким email не существует'
        return
      end
      if user[:password] != params[:pass]
        @err = 'Неправильное имя / пароль'
        return
      end


      cookies[:name] = user[:name] + " " + user[:lastname]
      cookies[:email] = user[:email]
      cookies[:pass] = user[:password]

      redirect_to '/investment'

    end
  end


  def logout
    cookies.delete(:name)
    cookies.delete(:email)
    cookies.delete(:pass)

    redirect_to '/'
  end
end