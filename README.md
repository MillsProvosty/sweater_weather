# Sweater Weather

Sweater Weather is a project designed to showcase building API endpoints, authenticating users through the use of bcrypt and assigning randomly generated api_keys, the consumption of several API's such as Googles Geocoding API, Darksky's API and Upsplash API, as well as the ability to push to production on Heroku.

![Backgrounds](/app/assets/images/background.png)

![Forecast](/app/assets/images/forecast.png)

![Roadtrip](/app/assets/images/roadtrip.png)

![WeatherGifs](/app/assets/images/weathergifs.png)

## Endpoints

* User account creation returns api key & sad path:
  ```
  POST  https://nameless-falls-13816.herokuapp.com/api/v1/users?email=new_email@hotmail.com&password=password&password_confirmation=password
  ```
  ```
  POST https://nameless-falls-13816.herokuapp.com/api/v1/users?email=new_email@hotmail.com&password=password&password_confirmation=notpassword
  ```

* User login creates session, returns api key & sad path:
  ```
  POST https://nameless-falls-13816.herokuapp.com/api/v1/sessions?email=new_email@hotmail.com&password=password
  ```
  ```
  POST  https://nameless-falls-13816.herokuapp.com/api/v1/sessions?email=new_email@hotmail.com&password=notpassword
  ```
  
* Gifs for five day forecast with passed in location:
  ```
  GET https://nameless-falls-13816.herokuapp.com/api/v1/gifs?location=denver,co
  ```

* Background gif that matches current weather:
  ```
  GET  https://nameless-falls-13816.herokuapp.com/api/v1/backgrounds?location=denver,co
  ```

* Current forecast for passed in location:
  ```
  GET  https://nameless-falls-13816.herokuapp.com/api/v1/forecast?location=denver,co
  ```

* Roadtrip feature returns weather for estimated time of arrival & sad path:
  ```
  POST  https://nameless-falls-13816.herokuapp.com/api/v1/road_trip?origin=Denver,Co&destination=NewOrleans,LA&api_key=6eef84e4de77bffd8132de088d9652e5
  ```
  ```
  POST  https://nameless-falls-13816.herokuapp.com/api/v1/road_trip?origin=Denver,Co&destination=NewOrleans,LA&api_key=6eef84e4
  ```


## Built Using

* Rails 5.2.3
* Ruby 2.4.1
* PostgreSQL database

## Run Sweater Weather on your local machine

1. `$ git clone git@github.com:MillsProvosty/sweater_weather.git`
2. `$ bundle`
3. 'bundle exec figaro install' -- add your API keys to `config/application.yml`:

```
GOOGLE_API_KEY: <your Google API key>
DARKSKY_API_KEY: <your Darksky API key>
UNSPLASH_ACCESS_KEY: <your Unsplash Access key>
UNSPLASH_SECRET_KEY: <your Unsplash Secret key>
GIPHY_API_KEY: <your Giphy API key>
```
4. `$ bundle exec rspec install`
5. `$ rails db:{create,migrate}`
6. Run test suite with `$ bundle exec rspec`
7. Start a local server with `$ rails s` -- access Sweater Weather endpoints in browser or Postman at `localhost:3000`
