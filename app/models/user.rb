class User < ApplicationRecord
  #Поля не пустые
  # validates :name, :lastname, :email, :password, presence:true
  validates :email, uniqueness: {message: "Учетная запись с таким email уже была создана!"}
end
