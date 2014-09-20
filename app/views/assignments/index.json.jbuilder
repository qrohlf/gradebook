json.array!(@assignments) do |assignment|
  json.extract! assignment, :id, :title, :details
  json.url assignment_url(assignment, format: :json)
end
