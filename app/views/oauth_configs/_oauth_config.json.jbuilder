json.extract! oauth_config, :id, :provider, :provider_app_id, :provider_app_secret, :scope, :created_at, :updated_at
json.url oauth_config_url(oauth_config, format: :json)
