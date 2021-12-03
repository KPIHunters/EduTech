class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :name, null: false
      t.string :target, null: false
      t.string :options, null: false
      t.datetime :deleted_at, null: true

      t.timestamps
    end
  end
end
