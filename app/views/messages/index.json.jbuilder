json.array!(@messages) do |message|
  json.extract! message, :name, :target_name, :target_email, :text, :ip, :status
  json.url message_url(message, format: :json)
end
