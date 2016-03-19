class Article::Post::FeatureImageUploader < ImageUploader
  process scale: [1280, 720]
end
