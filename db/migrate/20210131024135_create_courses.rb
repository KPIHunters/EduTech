class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :name, limit: 70, null: false
      t.string :description, limit: 250, null: false
      t.string :icon, limit: 55, null: true
      t.datetime :deleted_at, null: true

      t.timestamps
    end
  end
end
