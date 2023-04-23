# Items store 

This is an application where you can upload your second-hand items

<p align="center">
  <img src="https://user-images.githubusercontent.com/89556233/233819108-b77a2830-1ba3-4e61-8116-754d0664a6ba.png" width="900" height="540" style="text-align:center;">
</p>


## Minimum requirements🛍️
- Ruby 3.2.1
- Rails 7.0.4

# Libraries
- [PosgreSQL](https://www.postgresql.org/)
- [Tailwind CSS](https://tailwindcss.com/)
- [Turbo](https://turbo.hotwired.dev/)

## Configuration
1. Create the data base and run the migrations:
```ruby
rails db:create db:migrate
```

2. Install the gems
```ruby
bundle install
```

3. _(Optional)_ If you want to load the fixture data, use the following command
```ruby
rails db:fixtures:load
```

## Start the server
After pre-configuring the application, use one of the following commands to run the server:
```ruby
rails s
./bin/dev
```
