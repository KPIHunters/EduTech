class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :name
      t.string :target
      t.string :options

      t.timestamps
    end
  end
end
