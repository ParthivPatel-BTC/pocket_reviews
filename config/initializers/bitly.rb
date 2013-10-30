Bitly.configure do |config|
  config.api_version = 3
  config.login = Settings.bitly.login
  config.api_key = Settings.bitly.api_key
end