class WelcomeController < ApplicationController
  def index
    @posts = Article::Post.as(:p).published(:p).limit(6)
  end

  def about
  end

  def privacy
  end
end
