class UserBlogsController < ApplicationController
  def change_role(user_email)
    @user_blogs = User.find_by(email:"#{user_email}").user_blogs
    @user_blogs.each do |a|
      a.role
    end
  end
end
