class AddReference < ActiveRecord::Migration[6.1]
  def change
    add_index :user_blogs, :user_id
    add_index :user_blogs, :blog_id
  end
end
