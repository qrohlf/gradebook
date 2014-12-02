# Gradebook

Gradebook is a tool for managing assignments submitted via a GitHub repo, using tags to differentiate between assignments. The bulk of it was written over the course of about 6 hours, after I got really fed up with trying to use Google Spreadsheets to input grades.

## Features

- Automatic submission tracking via the Github API
- Supports assignment resubmission using version numbers
- Secure private links for students to view their grades
- Secure administrator login via Google OAuth
- Nice admin UI (Bootstrap)

## Use

1. Clone the repo
2. Edit `config/initializers/admin_users.rb` to reflect the admins' google account info.
3. Set the `GOOGLE_CLIENT_ID`, `GOOGLE_CLIENT_SECRET`, `GITHUB_CLIENT_ID`, and `GITHUB_CLIENT_SECRET` environment variables with your GitHub and Google API credentials (if you're deploying to heroku, you'll need to set those on the server as well).
4. Install dependencies with `bundle install`
5. Create the database with `rake db:create db:migrate` (you will need to have postgres installed)
6. Run this app with `rackup` or `shotgun`

## Screenshots

![screen shot 2014-09-23 at 1 28 18 pm](https://cloud.githubusercontent.com/assets/347189/4379384/2edd2180-4360-11e4-8e2a-b3f88cdcb531.png)

![screen shot 2014-10-25 at 10 44 24 am](https://cloud.githubusercontent.com/assets/347189/4780572/a6b33402-5c6e-11e4-9a66-42e32799bb98.png)

![screen shot 2014-09-23 at 12 54 04 pm](https://cloud.githubusercontent.com/assets/347189/4378829/991ac53e-435b-11e4-9986-918dff95eddc.png)

![screen shot 2014-09-24 at 8 58 33 am](https://cloud.githubusercontent.com/assets/347189/4391275/bb40e352-4403-11e4-8111-b33b7534828a.png)
