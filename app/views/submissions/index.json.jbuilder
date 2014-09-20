json.array!(@submissions) do |submission|
  json.extract! submission, :id, :link, :assignment_id, :student_id, :status
  json.url submission_url(submission, format: :json)
end
