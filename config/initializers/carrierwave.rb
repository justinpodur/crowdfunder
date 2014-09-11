CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => ENV["aws_access_key_id"],                        # required
    :aws_secret_access_key  => ENV["aws_secret_access_key"],                        # required
    :region                 => 'us-west-2'
  }
  config.fog_directory  = 'rain-forestbucket'                     # required
  config.fog_public     = true                                   # optional, defaults to true
end