class UserBlogs < ApplicationRecord
  belongs_to :user
  belongs_to :blog

  enum role: { owner: 0, editor: 1}
end
