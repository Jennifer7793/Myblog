class Blog < ApplicationRecord
  validates :title, :content, presence: true

  has_many :articles, dependent: :delete_all
  has_many :user_blogs, dependent: :delete_all
  has_many :users, through: :user_blogs
end
