class AddAuthorToFoods < ActiveRecord::Migration[6.0]
  def change
    add_reference :food, :author, foreign_key: { to_table: :users }
  end
end
