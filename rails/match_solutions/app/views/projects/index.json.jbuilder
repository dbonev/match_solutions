json.array!(@projects) do |project|
  json.extract! project, :id, :name, :email, :description, :location, :created_at
  json.url project_url(project, format: :json)
end
