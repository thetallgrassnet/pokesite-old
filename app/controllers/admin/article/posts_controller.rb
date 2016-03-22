class Admin::Article::PostsController < Admin::ResourceController
  resource ::Article::Post, %w( author_id column_id headline subhead body is_featured is_published published_at feature_image )

  def index
    (redirect_to(action: :index) and return) if params[:page] == "1"
    @article_posts = (current_user.is_admin? ? ::Article::Post.all : current_user.columns.posts)
      .order(created_at: :desc).page(params[:page]).per(10)
  end

  def create
    params[:article_post][:author_id] = current_user.uuid
    params[:article_post][:published_at] = nil if params[:article_post][:published_at].empty?
    super
  end
end
