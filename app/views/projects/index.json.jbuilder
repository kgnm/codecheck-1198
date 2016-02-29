json.array!(@projects) do |project|
  json.extract! project, :id, :url, :title, :description, :created_at
  json.url project_url(project, format: :json)
end
