class User < ApplicationRecord
  has_many :purchases
  has_many :invests, through: :purchases
  #Поля не пустые
  validates :name, :lastname, :email, :password, presence:true
  validates :email, uniqueness: {message: "Учетная запись с таким email уже была создана!"}
end
