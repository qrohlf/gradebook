json.array!(@messages) do |message|
  json.extract! message, :id, :sender, :body, :room_id, :timestamp
  json.url message_url(message, format: :json)
end
