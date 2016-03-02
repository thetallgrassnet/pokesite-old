class Article::ColumnsController < ApplicationController
  def index
    @title = "Articles"

    @posts = Article::Post.as(:p).published(:p).order(published_at: :desc).page(params[:page]).per(10)
    (not_found and return) if params[:page] and @posts.count == 0

    render "article/posts/index"
  end

  def show
    @column = Article::Column.find_by! slug: params[:id]
    @title = @column.name

    @posts = @column.posts(:p).published(:p).order(published_at: :desc).page(params[:page]).per(10)
    (not_found and return) if params[:page] and @posts.count == 0

    render "article/posts/index"
  end
end
