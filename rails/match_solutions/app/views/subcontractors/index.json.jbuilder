json.array!(@subcontractors) do |subcontractor|
  json.extract! subcontractor, :id
  json.url subcontractor_url(subcontractor, format: :json)
end
