class CreateLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :lessons do |t|
      t.string :icon, limit: 55, null: true
      t.string :name, limit: 70, null: false
      t.string :playlist_id, null: true
      t.string :video_id, null: true
      t.datetime :deleted_at, null: true
      t.belongs_to :period, null: false, foreign_key: true

      t.timestamps
    end
  end
end
