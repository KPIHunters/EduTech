class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :phone, limit: 20, null: false # TODO validate with regex checking if ir 3o number is a 9
      t.string :state_ibge, null: false
      t.string :county_ibge, null: false
      t.string :full_address, limit: 140, null: false
      t.string :zip_code, limit: 20,  null: false
      t.string :company_fantasy_name, limit: 60, null: true
      t.string :company_legal_name, limit: 70, null: true
      t.string :website, null: true
      t.string :gov_id_pf, limit: 25, null: false
      t.string :gov_id_pj, limit: 25, null: true
      t.string :description, limit: 70, null: true
      t.string :facebook_link, null: true
      t.string :twitter_link, null: true
      t.string :linkedin_link, null: true
      t.string :bio, null: true

      t.string :bank_code, limit: 10, null: true
      t.string :bank_agency, limit: 15, null: true
      t.string :bank_account, limit: 30, null: true

      t.boolean :validated_docs, null: true, default: false
      t.datetime :deleted_at, null: true

      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :profiles, :gov_id_pf, unique: true
  end
end
