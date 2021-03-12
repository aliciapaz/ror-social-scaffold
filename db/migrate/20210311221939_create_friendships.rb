class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.references :requester, index: true
      t.references :requestee, index: true
      t.string :status

      t.timestamps
    end
    add_foreign_key :friendships, :users, column: :requester_id 
    add_foreign_key :friendships, :users, column: :requestee_id 
  end
end
