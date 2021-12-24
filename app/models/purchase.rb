class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :invest
  #Поля не пустые
  #validates :date, :count, :coast, presence: true
end
