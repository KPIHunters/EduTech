class CreateOAuthConfigs < ActiveRecord::Migration[6.0]
  def change
    create_table :oauth_configs do |t|
      t.string :provider, null: false
      t.string :provider_app_id, null: false
      t.string :provider_app_secret, null: false
      t.string :scope, null: true

      t.datetime :deleted_at, null: true

      t.timestamps
    end
  end
end
