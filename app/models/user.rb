class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { minimum: 6 }
end
