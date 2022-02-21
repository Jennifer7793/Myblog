class UserBlogs < ApplicationRecord
  belongs_to :user
  belongs_to :blog

  enum role: { owner: 0, blogs_editor: 1, blog_editor: 2}
end
