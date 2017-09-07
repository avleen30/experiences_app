json.extract! event, :id, :name, :description, :cover_img, :start_date, :end_date, :creator_id, :lng, :lat, :created_at, :updated_at
json.url event_url(event, format: :json)
