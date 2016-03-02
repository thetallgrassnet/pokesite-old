class Article::PostAccess < BaseAccess
  def show?(post)
    !post.published_at.nil? && post.published_at < DateTime.now
  end
end
