json.extract! event, :id, :name, :description, :cover_img, :start_date, :time, :creator_id, :lng, :lat, :created_at, :updated_at
json.url event_url(event, format: :json)
json.icon event.category
