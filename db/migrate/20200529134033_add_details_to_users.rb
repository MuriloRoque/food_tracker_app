class AddDetailsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :age, :integer
    add_column :users, :gender, :string
    add_column :users, :height, :decimal
    add_column :users, :weight, :decimal
    add_column :users, :activity, :string
  end
end
