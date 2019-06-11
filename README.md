# pizza-analytics
Welcome to *Pizza Analytics*, a Ruby-Sinatra-Grape-Sequel API powered Web-app designed with React. With *Pizza Analytics*, the user can see all pizzas and people within the database. A user can search people by name and see all pizzas by topping. The highest day of sales in a month is displayed, as well as streaks of days that are greater than the day before.

This project was originally created for a company take home coding assignment. 

## Installation and Usage
Clone repository `$ git clone git@github.com:torianne02/pizza-analytics.git`

Change directory by running `$ cd pizza-analytics`.

Then, run the following:
```ruby
$ bundle install
$ createdb pizza_analytics_development
$ createdb pizza_analytics_test
$ sequel -m db/migrate/ postgres://localhost/pizza_analytics_development
$ sequel -m db/migrate/ postgres://localhost/pizza_analytics_test
$ shotgun -p 9393
```
You will then need to open up a web browser at the server that is listening, which should look like this  `http://127.0.0.1:9393/`

Clone repository `$ git clone git@github.com:torianne02/pizza-analytics-frontend.git`

Change directory by running `$ cd pizza-analytics-frontend`

Then, run the following:
``` ruby
$ run npm install
$ run npm start
```

## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/torianne02/pizza-analytics.git. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License
This app is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct
Everyone interacting in the Pizza Analytics project's codebases, issue trackers, chat rooms, and mailing lists are expected to follow the [code of conduct](https://github.com/torianne02/pizza-analytics/blob/master/CODE_OF_CONDUCT.md)

## Credits
Ruby
Grape
Sinatra
Sequel
Postgres
