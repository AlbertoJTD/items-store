# Items Store 🛍️

This is an application where you can upload your second-hand items

<p align="center">
  <img src="https://user-images.githubusercontent.com/89556233/233819108-b77a2830-1ba3-4e61-8116-754d0664a6ba.png" width="1000" height="655" style="text-align:center;">
</p>


## Minimum requirements
- Ruby 3.2.1
- Rails 7.0.4

# Libraries
- [Stimulus JS](https://stimulus.hotwired.dev)
- [Tailwind CSS](https://tailwindcss.com/)
- [Turbo](https://turbo.hotwired.dev/)
- [PosgreSQL](https://www.postgresql.org/)

## Configuration
1. Create the data base and run the migrations:
```ruby
rails db:create db:migrate
```

2. Install the gems
```ruby
bundle install
```

_(optional)_ If you want to load the data that are in the fixtures, run the following command:
```ruby
rails db:fixtures:load
```

## Start the server
After pre-configuring the application, use one of the following commands to run the server:
```ruby
rails s
./bin/dev
```

## Run tests
Execute the following command to run the test:
```ruby
rails test
```
