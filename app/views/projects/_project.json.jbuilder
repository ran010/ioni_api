json.extract! project, :id, :name, :description,:members,:batch,:language, :created_at, :updated_at
json.url project_url(project, format: :json)
