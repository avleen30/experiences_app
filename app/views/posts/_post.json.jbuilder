json.extract! post, :id, :content, :attachment, :created_at, :updated_at
json.url post_url(post, format: :json)
