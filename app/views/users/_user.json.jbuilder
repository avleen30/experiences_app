json.extract! user, :id, :email, :first_name, :last_name, :gender, :avatar, :dob, :created_at, :updated_at
json.url user_url(user, format: :json)
