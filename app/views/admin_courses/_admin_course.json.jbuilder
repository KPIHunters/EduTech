json.extract! admin_course, :id, :admin, :user_id, :course_id, :created_at, :updated_at
json.url admin_course_url(admin_course, format: :json)
