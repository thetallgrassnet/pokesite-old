class WelcomeController < ApplicationController
  def index
    @posts = Article::Post.as(:p).published(:p).featured.limit(6).with_associations(:column)
  end

  def about
  end

  def privacy
  end
end
