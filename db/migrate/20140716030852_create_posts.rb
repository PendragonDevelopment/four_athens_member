class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer "user_id"
      t.text "post_content"
      t.timestamps
    end
    add_index("posts", "user_id")
  end
end
