class Blog < ApplicationRecord
  has_many :articles, dependent: :delete_all
  has_many :user_blogs, dependent: :delete_all
  has_many :user, through: :user_blogs

  scope :editable_blog, ->(user_id) {joins(:user_blogs).where('user_blogs.user_id = ? and user_blogs.role != 0', user_id)}
  scope :own_blog, ->(user_id) {joins(:user_blogs).where('user_blogs.user_id = ? and user_blogs.role = 0', user_id)}
end
