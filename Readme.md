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
3. Set the `GOOGLE_CLIENT_ID`, `GOOGLE_CLIENT_SECRET`, `GITHUB_CLIENT_ID`, and `GITHUB_CLIENT_SECRET` environment variables (if you're deploying to heroku, you'll need to set those on the server as well).
4. You're ready to go!
