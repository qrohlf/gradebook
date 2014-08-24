namespace :production:nuke_data do
  system "heroku pg:reset --confirm lumberjack DATABASE_URL"
  system "heroku run rake db:migrate"
end
