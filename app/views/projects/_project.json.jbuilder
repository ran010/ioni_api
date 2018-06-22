json.extract! project, :id, :name, :description,:members,:batch,:language, :created_at, :updated_at


if project.document.present?
  json.url (project.document.document.path)
end
