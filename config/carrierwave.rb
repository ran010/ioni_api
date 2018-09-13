CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'Google',
    google_storage_access_key_id: 'GOOG3424ZVNGNCMPCHV5KRRH',
    google_storage_secret_access_key: 'ojUj1ULn6ki1Qkfh+zXJs/gYNQuPK7LELCabT/3E'
  }
  config.fog_directory = 'photo-of-the-day'
end
