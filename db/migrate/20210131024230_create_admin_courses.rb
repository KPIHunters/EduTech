class CreateAdminCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :admin_courses do |t|
      t.boolean :admin, null: false, default: false
      t.datetime :deleted_at, null: true
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
