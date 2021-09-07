json.extract! room, :id, :title, :description, :body, :created_at, :updated_at
json.url room_url(room, format: :json)
