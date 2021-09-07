json.extract! booking, :id, :arrive, :departure, :room_id, :user_id, :created_at, :updated_at
json.url booking_url(booking, format: :json)
