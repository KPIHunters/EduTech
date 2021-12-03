class CreateJoinTableProfilesExperiences < ActiveRecord::Migration[6.0]
  def change
    create_join_table :profiles, :experiences
  end
end
