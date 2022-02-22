class UserBlog < ApplicationRecord
  belongs_to :user
  belongs_to :blog

  enum role: { owner: 0, viewer: 1, editor: 2 }
end
