class Blog < ApplicationRecord
  has_many :articles, dependent: :delete_all
  # belongs_to :user
  has_many :user_blogs, dependent: :delete_all
  has_many :users, through: :user_blogs
end
