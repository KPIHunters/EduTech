json.extract! profile, :id, :full_name, :phone, :state_ibge, :county_ibge, :full_address, :zip_code, :company_fantasy_name, :company_legal_name, :website, :gov_id_pf, :description, :user_id, :created_at, :updated_at
json.url profile_url(profile, format: :json)
