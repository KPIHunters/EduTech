class CreateSocialSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :social_sessions do |t|
      t.string :uid, null: false
      t.string :username, null: true
      t.string :email, null: true
      t.string :access_token, null: false
      t.integer :provider_id, null: false
      t.string :bio, null: true
      t.text :extra, null: true
      
      t.datetime :deleted_at, null: true
      
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
