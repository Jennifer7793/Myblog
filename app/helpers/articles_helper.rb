module ArticlesHelper
  def can_edit?(num)
    current_user.blog_ids.include?(num)
  end
end
