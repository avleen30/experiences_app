json.extract! events_user, :id, :status, :rating, :created_at, :updated_at
json.url events_user_url(events_user, format: :json)
