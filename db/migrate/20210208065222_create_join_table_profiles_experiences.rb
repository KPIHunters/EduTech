class CreateJoinTableProfilesExperiences < ActiveRecord::Migration[6.0]
  def change
    create_join_table :profiles, :experiences do |t|
      # t.index [:profile_id, :experience_id]
      # t.index [:experience_id, :profile_id]
    end
  end
end
