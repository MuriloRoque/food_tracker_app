class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { minimum: 6 }
  has_many :foods, foreign_key: :author_id
end
