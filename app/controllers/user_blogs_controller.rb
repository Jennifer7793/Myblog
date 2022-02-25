class UserBlogsController < ApplicationController
  def change_role
    user_email = params[:email]
    @user = User.find_by(email: user_email)
    user_blog = @user.user_blogs.where(blog_id: params[:id])
    if user_blog.present?
      redirect_to blog_path(params[:id])
      flash.alert = "The user already owned this blog"
    else
      @user.blogs << Blog.find(params[:id]) 
      @user.user_blogs.last.update(role: 2)
    end
  end
end