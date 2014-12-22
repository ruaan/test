json.array!(@projects) do |project|
  json.extract! project, :id, :customer, :name, :version, :description, :documentType, :market, :startDate, :followUp, :pricelist, :projectStage, :T
  json.url project_url(project, format: :json)
end
