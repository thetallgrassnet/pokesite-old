class Article::ColumnsController < ApplicationController
  def index
    @title = "Articles"
    @posts = Article::Post.all

    render "article/posts/index"
  end

  def show
    @column = Article::Column.find_by! slug: params[:id]
    @posts = @column.posts
    @title = @column.name

    render "article/posts/index"
  end
end
