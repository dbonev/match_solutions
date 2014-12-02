json.array!(@users) do |user|
  json.extract! user, :id, :email, :password, :created_at
  json.url user_url(user, format: :json)
end
