# _shoe-distribution_

##### This application is designed to show a many-to-many relationship between stores and brands.

## Technologies Used

Application: Ruby, Sinatra, psql<br>
Testing: Rspec, Capybara<br>
Database: Postgres

Installation
------------

```
$ git clone https://github.com/JulieChristine/shoe-distribution.git
```

Install required gems:
```
$ bundle install
```

Create databases:

1. Type psql on your terminal to connect to the server:

```
psql
```

2. Create databases and the following tables:

```
rake db:create
```

Start the webserver:
```
$ ruby app.rb
```

Navigate to `localhost:4567` in browser.
