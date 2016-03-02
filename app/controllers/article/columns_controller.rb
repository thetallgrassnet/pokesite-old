class Article::ColumnsController < ApplicationController
  def index
    @title = "Articles"
    @posts = Article::Post.published.order(published_at: :desc)

    render "article/posts/index"
  end

  def show
    @column = Article::Column.find_by! slug: params[:id]
    @posts = @column.posts.published.order(published_at: :desc)
    @title = @column.name

    render "article/posts/index"
  end
end
