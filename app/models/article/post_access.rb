class Article::PostAccess < BaseAccess
  def manage?(post)
    current_user.is_admin? or current_user.columns.size > 0
  end

  def show?(post)
    post.published?
  end

  def edit?(post)
    current_user == post.author or
      current_user.is_editor_for?(post.column) or
      current_user.is_admin?
  end

  def destroy?(post)
    current_user.is_editor_for?(post.column) or
      current_user.is_admin?
  end
end
