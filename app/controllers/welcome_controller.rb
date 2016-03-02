class WelcomeController < ApplicationController
  def index
    @posts = Article::Post.published.order_by(published_at: :desc).limit(6)
  end
end
