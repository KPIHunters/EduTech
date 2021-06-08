class AddSortToLessons < ActiveRecord::Migration[6.0]
  def change
    add_column :lessons, :sort_position, :integer
  end
end
