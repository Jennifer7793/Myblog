class UserBlog < ApplicationRecord
  belongs_to :user
  belongs_to :blog

  enum role: { viewer: 0, owner: 1, editor: 2 }
end
