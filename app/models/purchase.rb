class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :investment
  #Поля не пустые
  validates_presence_of :date, :quantity, :coast
end
