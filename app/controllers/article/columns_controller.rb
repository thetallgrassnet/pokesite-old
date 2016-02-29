class Article::ColumnsController < ApplicationController
  def index
    @title = "Articles"
    @posts = Article::Post.published

    render "article/posts/index"
  end

  def show
    @column = Article::Column.find_by! slug: params[:id]
    @posts = @column.posts.published
    @title = @column.name

    render "article/posts/index"
  end
end
