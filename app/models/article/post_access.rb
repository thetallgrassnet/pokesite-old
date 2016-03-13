class Article::PostAccess < BaseAccess
  def manage?(post)
    current_user.is_admin? or current_user.columns.size > 0
  end

  def show?(post)
    post.published?
  end
end
