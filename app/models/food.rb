class Food < ApplicationRecord
  belongs_to :author, foreign_key: :author_id, class_name: 'User'
  belongs_to :group, foreign_key: :group_id, optional: true

  validates :name, presence: true, uniqueness: true, length: { in: 3..15 }
  validates :amount, presence: true, numericality: { less_than_or_equal_to: 1000, only_integer: true }
end
