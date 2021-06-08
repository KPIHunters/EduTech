class AddSortToPeriods < ActiveRecord::Migration[6.0]
  def change
    add_column :periods, :sort_position, :integer
  end
end
