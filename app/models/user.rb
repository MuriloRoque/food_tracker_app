class User < ApplicationRecord
  has_many :foods, foreign_key: :author_id
  
  validates :name, presence: true, uniqueness: true, length: { minimum: 6 }
end
