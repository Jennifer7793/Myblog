class CreateUserBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :user_blogs do |t|
      t.integer :role, default: 0
      t.integer :user_id
      t.integer :blog_id
      t.timestamps
    end
  end
end
