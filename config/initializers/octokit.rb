Octokit.configure do |c|
  c.client_id = Rails.application.secrets.github_client_id
  c.client_secret = Rails.application.secrets.github_client_secret
end
