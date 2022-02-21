class BlogPolicy < ApplicationPolicy
  attr_reader :user, :blog
  def initialize(user, blog)
    @user = user
    @blog = blog
  end

  def edit?
    
  end

  def update?
    
  end
    
  def destroy?
  
  end
end