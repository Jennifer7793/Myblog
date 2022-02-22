module ArticlesHelper
  def can_edit?(blog_id)
    current_user.blog_ids.include?(blog_id.to_i)
  end
end
