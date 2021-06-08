class CreateExperiences < ActiveRecord::Migration[6.0]
  def change
    create_table :experiences do |t|
      t.string :name, limit: 80, null: false
      t.datetime :deleted_at, null: true

      t.timestamps
    end
  end
end
