json.extract! application, :id, :name, :email, :about_you, :how_you_found_us, :why_volunteer, :created_at, :updated_at
json.url application_url(application, format: :json)
