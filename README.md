# Bookstore App [![CircleCI](https://circleci.com/gh/Dimetriu/Bookstore-econnerce.svg?style=svg)](https://circleci.com/gh/Dimetriu/Bookstore-econnerce)

## Ruby version `2.5.0`

### System dependencies

You may want to use ```ruby gem capybara-webkit```, which depends on qt5.
To make this work open up your shell and type the folowing command:

($): sudo apt-get install qt5-default libqt5webkit5-dev gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x

### Configuration

Set up a **staging** environment if needed additionally to the default **test**, **development** and **production**.

Actually this behaves like a production environment, so the configuration might look like this:

```ruby
# config/environments/staging.rb

require File.expand_path('../production.rb', __FILE__) # just to copy the production.rb settings
```
Or alternatively you can specify your own configurations:

```ruby
Rails.application.configure do
  # ...

  # Use a different cache store in staging.
  config.cache_store = :mem_cache_store

  # ...
```

### Database creation

This project uses * postgresql * adapter.

To create a **bookstore_test** and **bookstore_development** database simply run:

($): rails db:create

For the staging environment add the folowing lines to * config/database.yml *:

```ruby
  staging:
    <<: *default
    database: bookstore_staging
```

Don`t forget to generate a secret key:

($): rails secret

Clip and paste that line to * config/secrets.yml *:

```ruby
  # your secret key generated previously
  staging:
    secret_key_base: 67b62eabff24448643c994fbefe789f1ae1210a37b009f106184ed2777464d121d63da0f8410abe73d566183892ad83cb19502c23cca36c4a8a949b04d6a15e6 
```

And create the staging database:

($): RAILS_ENV=staging rails db:create

### Database initialization

To initialize an empty database simply run:

($): rails db:schema:load

### TODO

1 How to run the test suite

2 Services (job queues, cache servers, search engines, etc.)

3 Deployment instructions
