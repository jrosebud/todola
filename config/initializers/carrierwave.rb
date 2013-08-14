CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'AKIAIXJZYYEKHR4U733Q',                        # required
    :aws_secret_access_key  => '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',                        # required
    :region                 => 'us-west-1'                # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'todophotos'                     # required
  config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end