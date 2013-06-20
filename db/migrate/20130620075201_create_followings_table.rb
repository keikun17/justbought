class CreateFollowingsTable < ActiveRecord::Migration
  def change
    create_table :followings do |t|
      t.references :user
      t.integer :followed_id
    end

    add_index :followings, :followed_id
    add_index :followings, :user_id
  end
end
