class AddBirthdayToProfile < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :birthday, :date, null: false
  end
end
