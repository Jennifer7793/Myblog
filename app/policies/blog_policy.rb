class BlogPolicy < ApplicationPolicy
  attr_reader :user, :blog

  def initialize(user, blog)
    @user = user
    @blog = blog
  end

  def edit?
    user.user_blogs.find_by(blog_id: @blog.id).owner? || user.user_blogs.find_by(blog_id: @blog.id).editor?
  end

  def update?
    
  end
    
  def destroy?
    user.user_blogs.find_by(blog_id: @blog.id).owner?
  end
end