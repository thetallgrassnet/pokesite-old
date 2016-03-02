class Article::PostsController < ApplicationController
  def show
    @post = Article::Post.find_by! slug: params[:id]
    authorize! :show, @post
  end
end
