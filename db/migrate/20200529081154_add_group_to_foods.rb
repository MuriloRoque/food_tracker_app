class AddGroupToFoods < ActiveRecord::Migration[6.0]
  def change
    add_reference :foods, :group, foreign_key: true
  end
end
