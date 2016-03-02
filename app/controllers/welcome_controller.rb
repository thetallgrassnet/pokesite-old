class WelcomeController < ApplicationController
  def index
    @posts = Article::Post.as(:p).published(:p).order_by(published_at: :desc).limit(6)
  end
end
