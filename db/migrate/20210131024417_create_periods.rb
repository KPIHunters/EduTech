class CreatePeriods < ActiveRecord::Migration[6.0]
  def change
    create_table :periods do |t|
      t.string :name, limit: 70, null: false
      t.integer :order, null: true
      t.string :icon, limit: 55, null: true
      t.datetime :deleted_at, null: true
      t.belongs_to :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
