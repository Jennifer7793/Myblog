class RemoveUserFromBlog < ActiveRecord::Migration[6.1]
  def change
    remove_reference :blogs, :user, null: false, foreign_key: false
  end
end
