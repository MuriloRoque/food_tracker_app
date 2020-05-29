class User < ApplicationRecord
  has_many :foods, foreign_key: :author_id
  
  validates :name, presence: true, uniqueness: true, length: { minimum: 6 }
  validates :age, presence: true, numericality: { more_than_or_equal_to: 1, only_integer: true }
  validates :height, presence: true, numericality: { less_than_or_equal_to: 10 }
  validates :weight, presence: true, numericality: { less_than_or_equal_to: 1200 }
  validates :gender, presence: true
end
