require 'aws-sdk'

client = Aws::S3::Client.new(
  region: 'ap-northeast-1',
  access_key_id: Rails.application.secrets.aws_access_key_id,
  secret_access_key: Rails.application.secrets.aws_secret_access_key
)
