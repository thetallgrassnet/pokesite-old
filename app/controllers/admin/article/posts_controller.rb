class Admin::Article::PostsController < Admin::ResourceController
  resource ::Article::Post, %w( author_id column_id headline subhead body is_featured is_published published_at feature_image )

  before_filter :typecast_published_at, only: [:create, :update]

  def index
    (redirect_to(action: :index) and return) if params[:page] == "1"
    @article_posts = (current_user.is_admin? ? ::Article::Post.all : current_user.columns.posts)
      .order(created_at: :desc).page(params[:page]).per(10)
  end

  def create
    params[:article_post][:author_id] = current_user.uuid
    super
  end

  private

  def typecast_published_at
    params[:article_post][:published_at] = params[:article_post][:published_at].to_datetime \
      if params[:article_post][:published_at].respond_to? :to_datetime
  end
end
