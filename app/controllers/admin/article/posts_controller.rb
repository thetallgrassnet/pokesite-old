class Admin::Article::PostsController < Admin::ResourceController
  resource ::Article::Post, %w( headline subhead body is_featured published_at feature_image )
end
