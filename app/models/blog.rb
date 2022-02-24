class Blog < ApplicationRecord
  has_many :articles, dependent: :delete_all
  has_many :user_blogs, dependent: :delete_all
  has_many :users, through: :user_blogs

  # scope :editable, -> { where('role = ?', 'owner' || 'editor') }
  # scope :shared_blog, -> (current_user.id) { joins(:user_blogs).where('user_blogs.user_id = ?', and user_blogs.role != 1, current_user.id) }
  # scope :own_blog, -> (current_user.id) { joins(:user_blogs).where('user_blogs.user_id = ?', and user_blogs.role = 1, current_user.id) }
end
