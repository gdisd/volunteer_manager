# README

# GDI San Diego Volunteer Management App

How To Run Locally

From the directory where you've cloned the repo, use the following commands:

```
cp config/database.example.yml config/database.yml #make edits
bundle install
bundle exec rake db:create db:migrate db:seed
rails s
```

To Run Tests

rspec spec/[path to test]

To Deploy:
TBD
