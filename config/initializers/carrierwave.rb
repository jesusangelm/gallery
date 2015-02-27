module CarrierWave
  module MiniMagick
    def quality(percentage)
      manipulate! do |img|
        img.quality(percentage.to_s)
        img = yield(img) if block_given?
        img
      end
    end
  end
end

if Rails.env.production?

  CarrierWave.configure do |config|
    config.fog_credentials = {
      :provider               => 'AWS',                         # required
      :aws_access_key_id      => ENV['S3_KEY_PROD'],            # required.
      :aws_secret_access_key  => ENV['S3_SECRET_KEY_PROD']      # required.
      #:region                 => 'eu-west-1',                  # optional, defaults to 'us-east-1'.
      #:host                   => 's3.example.com',             # optional, defaults to nil
      #:endpoint               => 'https://s3.example.com:8080' # optional, defaults to nil
    }

    config.cache_dir = "#{Rails.root}/tmp/uploads" # To let CarrierWave work on heroku

    config.fog_directory  = ENV['S3_BUCKET_PROD']                   # required.
    config.fog_public     = false                                   # optional, defaults to true
    config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  end

elsif Rails.env.development?

  CarrierWave.configure do |config|
    config.fog_credentials = {
      :provider               => 'AWS',                         # required
      :aws_access_key_id      => ENV['S3_KEY_DEV'],             # required.
      :aws_secret_access_key  => ENV['S3_SECRET_KEY_DEV']      # required.
      #:region                 => 'eu-west-1',                  # optional, defaults to 'us-east-1'.
      #:host                   => 's3.example.com',             # optional, defaults to nil
      #:endpoint               => 'https://s3.example.com:8080' # optional, defaults to nil
    }

    config.cache_dir = "#{Rails.root}/tmp/uploads" # To let CarrierWave work on heroku

    config.fog_directory  = ENV['S3_BUCKET_DEV']                    # required.
    config.fog_public     = false                                   # optional, defaults to true
    config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  end

end

