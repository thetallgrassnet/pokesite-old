Fog.mock!
connection = Fog::Storage.new(
  provider: 'AWS',
  aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
  aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
)
connection.directories.create(:key => ENV['AWS_S3_BUCKET'])
