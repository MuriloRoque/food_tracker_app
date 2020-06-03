class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.references :author, index: true, foreign_key: {to_table: :users}
      t.string :name
      t.integer :amount

      t.timestamps
    end
  end
end
