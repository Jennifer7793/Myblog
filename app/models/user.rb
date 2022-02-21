class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :blogs, through: :user_blogs
  has_many :user_blogs, dependent: :delete_all
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 
end
