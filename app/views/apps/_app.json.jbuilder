json.extract! app, :id, :name, :domain, :registrable, :is_active, :user_id, :created_at, :updated_at
json.url app_url(app, format: :json)
