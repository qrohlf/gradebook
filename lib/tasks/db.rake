namespace :db do
  desc "TODO"
  task nuke_production_data: :environment do
    system "heroku pg:reset --confirm lumberjack-qr DATABASE_URL"
    system "heroku run rake db:migrate"
  end

end
