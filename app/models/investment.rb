class Investment < ApplicationRecord
  has_one :purchase
  has_one :user, through: :purchase
  #Поля не пустые
  validates_presence_of :name, :rate, :code
end