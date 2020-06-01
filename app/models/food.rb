class Food < ApplicationRecord

  belongs_to :author, foreign_key: :author_id, class_name: 'User'
  belongs_to :group, foreign_key: :group_id, class_name: 'Group', optional: true

  validates :name, presence: true, length: { in: 3..15 }
  validates :amount, presence: true, numericality: { less_than_or_equal_to: 5000, only_integer: true }

  scope :current_author, lambda { |user|
    where(author_id: user.id).where.not(group_id: nil)
  }
end
