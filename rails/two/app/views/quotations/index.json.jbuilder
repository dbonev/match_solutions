json.array!(@quotations) do |quotation|
  json.extract! quotation, :id, :project_id, :created_at, :description
  json.url quotation_url(quotation, format: :json)
end
