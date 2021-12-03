class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      t.string :name, limit: 25, null: false
      t.string :title, limit: 55, null: true
      t.string :description, limit: 250, null: true
      t.datetime :deleted_at, null: true

      t.timestamps
    end
  end
end
