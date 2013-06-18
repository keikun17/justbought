class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :user, null: false
      t.text :raw_comment
      t.timestamps
    end

    add_index :posts, :user_id
  end
end
