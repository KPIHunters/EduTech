class CreateApps < ActiveRecord::Migration[6.0]
  def change
    create_table :apps do |t|
      t.string :name, null: false
      t.string :domain, null: false
      t.boolean :registrable, default: false
      t.boolean :is_active, default: true
      t.datetime :deleted_at, null: true

      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
