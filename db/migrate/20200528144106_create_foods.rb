class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.integer :author_id
      t.string :name
      t.integer :amount

      t.timestamps
    end
  end
end
