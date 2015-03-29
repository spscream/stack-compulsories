CarrierWave.configure do |config|

  if Rails.env.development? || Rails.env.test?
    config.storage = :file
  else
    config.storage = :fog
    config.fog_credentials = {
        :provider => 'Google',
        :google_storage_access_key_id => Rails.application.secrets.google_storage_key,
        :google_storage_secret_access_key => Rails.application.secrets.google_storage_secret
    }

    config.fog_directory = Rails.application.secrets.fog_directory
  end
end