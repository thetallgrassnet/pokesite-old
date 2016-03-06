CarrierWave.configure do |config|
  config.cache_dir = "#{Rails.root}/tmp/uploads"
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    region: ENV['AWS_REGION'],
    host: ENV['AWS_HOST'],
    endpoint: ENV['AWS_ENDPOINT']
  }
  config.fog_directory = ENV['AWS_S3_BUCKET']
  config.fog_public = true
  config.fog_attributes = {}
end
