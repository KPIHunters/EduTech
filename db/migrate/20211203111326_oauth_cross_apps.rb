class OAuthCrossApps < ActiveRecord::Migration[6.0]
  def change
    create_join_table :oauth_configs, :cross_apps
  end
end
