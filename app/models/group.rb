class Group < ApplicationRecord
  has_many :foods, foreign_key: :group_id
end
