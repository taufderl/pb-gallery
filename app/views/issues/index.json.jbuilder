json.array!(@issues) do |issue|
  json.extract! issue, :id, :name, :text
  json.url issue_url(issue, format: :json)
end
