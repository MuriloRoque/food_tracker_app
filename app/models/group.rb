class Group < ApplicationRecord
  has_many :foods, foreign_key: :group_id

  validates :name, presence: true, uniqueness: true, length: { in: 3..15 }
  validates :icon, format: { with: /.+\.(gif|jpe?g|png)\z/, message: 'Please use .gif, .jpeg, .jpg or .png' }
end
