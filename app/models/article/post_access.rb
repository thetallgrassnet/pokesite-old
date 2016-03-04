class Article::PostAccess < BaseAccess
  def show?(post)
    post.published?
  end
end
