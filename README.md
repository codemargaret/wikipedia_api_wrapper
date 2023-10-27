# Wikipedia API Wrapper

by Margaret Berry

### Technologies Used

This application uses Ruby 3.0.5p211 and Rails 7.0.5.
Data comes from the [Wikipedia API](https://wikitech.wikimedia.org/wiki/Analytics/AQS/Pageviews).

### Purpose

A user should be able to:

- See the most viewed articles yesterday.
- See the most viewed articles per week and per month.

### Setup Instructions

1. Ensure that you have the correct Ruby and Rails versions installed on your machine. See [the Rails docs](https://guides.rubyonrails.org/getting_started.html) for help.
2. Clone the application.
3. Within the home directory of the application, run ```bundle install```.
4. Run ```brew install redis```. This will set up in memory storage. You will not need to setup a separate database for this project.
5. Run ```rails s``` to start your local rails server.
6. Navigate to localhost:3000 in your browser.
7. To run tests, ```bin/rails test```

### API Endpoints

Get a list of the most viewed articles yesterday.

GET http://localhost:3000/most_viewed_yesterday

Get a list of the most viewed articles for the last week. The end date is yesterday's date and the start date is 7 days before yesterday.

GET http://localhost:3000/most_viewed_last_week

Get a list of the most viewed articles for the last month. The end date is yesterday's date and the start date is 30 days before yesterday.

GET http://localhost:3000/most_viewed_last_month

### License
This software is licensed under the MIT license.

Copyright (c) 2023 Margaret Berry
