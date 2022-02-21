class Blog < ApplicationRecord
  has_many :articles, dependent: :delete_all
  has_many :user_blogs, dependent: :delete_all
  has_many :users, through: :user_blogs
  belongs_to :user
  
end
