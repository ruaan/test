json.array!(@projects) do |project|
  json.extract! project, :id, :account_id, :projectName, :version, :documentType, :market, :randDollar, :randPound, :address, :contactPerson, :contactNumber, :notes, :flag
  json.url project_url(project, format: :json)
end
