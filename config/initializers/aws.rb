require 'aws-sdk'

Aws.config.update({
  region: 'ap-northeast-1',
  credentials: Aws::Credentials.new(Rails.application.secrets.aws_access_key_id, Rails.application.secrets.aws_secret_access_key)
})
