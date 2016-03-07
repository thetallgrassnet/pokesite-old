class Article::Post::FeatureImageUploader < ImageUploader
  process scale: [640, 360]
end
