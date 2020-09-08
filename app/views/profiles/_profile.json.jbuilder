json.extract! profile, :id, :full_name, :social_name, :birth_date, :job, :department, :created_at, :updated_at
json.url profile_url(profile, format: :json)
