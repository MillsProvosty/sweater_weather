# Sweater Weather

Sweater Weather is a project designed to showcase building API endpoints, authenticating users through the use of bcrypt and assigning randomly generated api_keys, the consumption of several API's such as Googles Geocoding API, Darksky's API and Upsplash API, as well as the ability to push to production on Heroku.

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
* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
