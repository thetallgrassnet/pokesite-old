class Article::ColumnsController < ApplicationController
  def index
    (redirect_to(article_path) and return) if params[:page] == "1"
    @title = "Articles"

    @posts = Article::Post.as(:p).published(:p).page(params[:page]).per(10)
    (not_found and return) if params[:page] and @posts.count == 0

    render "article/posts/index"
  end

  def show
    (redirect_to(article_column_path(id: params[:id])) and return) if params[:page] == "1"

    @column = Article::Column.find_by! slug: params[:id]
    @title = @column.name

    @posts = @column.posts(:p).published(:p).page(params[:page]).per(10)
    (not_found and return) if params[:page] and @posts.count == 0

    render "article/posts/index"
  end
end
