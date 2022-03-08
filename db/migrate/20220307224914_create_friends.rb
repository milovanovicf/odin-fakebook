class CreateFriends < ActiveRecord::Migration[6.1]
  def change
    create_table :friends do |t|
      t.references :friend_1, references: :users
      t.references :friend_2, references: :users
      t.timestamps
    end
  end
end
