class Article::PostsController < ApplicationController
  def show
    @post = Article::Post.all(:p).column(:c)
      .where('p.slug = {p_slug} and c.slug = {c_slug}')
      .params(p_slug: params[:id], c_slug: params[:column_id]).pluck(:p).first
  end
end
