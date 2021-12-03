class CreateOAuthConfigs < ActiveRecord::Migration[6.0]
  def change
    create_table :oauth_configs do |t|
      t.string :provider
      t.string :provider_app_id
      t.string :provider_app_secret
      t.string :scope

      t.timestamps
    end
  end
end
