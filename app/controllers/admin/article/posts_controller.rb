class Admin::Article::PostsController < Admin::ResourceController
  resource ::Article::Post, %w( headline subhead body is_featured published_at feature_image )

  def index
    (redirect_to(action: :index) and return) if params[:page] == "1"
    @article_posts = (current_user.is_admin? ? ::Article::Post.all : current_user.columns.posts)
      .order(created_at: :desc).page(params[:page]).per(10)
  end
end
