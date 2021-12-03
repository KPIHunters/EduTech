class CreateCrossApps < ActiveRecord::Migration[6.0]
  def change
    create_table :cross_apps do |t|
      t.string :name
      t.references :app, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
