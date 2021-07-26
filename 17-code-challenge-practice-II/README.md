# Rails Code Challenge Prep - Songs By JT

For this assessment, you'll be working with domain for Justin Timberlake superfans.

In this repo, there is a Rails application with some features built out. There
is also a fully built React frontend application (No there is Not), so you can test if your API is 
working.

Your job is to build out the Rails API to add the functionality described in the
deliverables below.

## Setup

To download the dependencies for the frontend and backend, run:

```sh
bundle install
```

**NEXT STEP WILL NOT WORK (SKIP)** 
```sh
npm install --prefix client
```

There is some starter code in the `db/seeds.rb` file so that once you've
generated the models, you'll be able to create data to test your application.

You can run your Rails API on [`localhost:3000`](http://localhost:3000) by running:

```sh
rails s
```

You can run your React app on [`localhost:4000`](http://localhost:4000) by running:

**NEXT STEP WILL NOT WORK (SKIP)** 
```sh
npm start --prefix client
```

You are not being assessed on React, and you don't have to update any of the React
code; the frontend code is available just so that you can test out the behavior
of your API in a realistic setting.

**NEXT STEP WILL NOT WORK (SKIP)**  

There are also tests included which you can run using `rspec` to check your work.

Depending on your preference, you can either check your progress by:

- Running `rspec` and seeing if your code passes the tests
- Running the React application in the browser and interacting with the API via
  the frontend
- Running the Rails server and using Postman make requests

## Models

You need to create the following relationships:

- A `Song` has many `SuperFan`s through `Review`
- A `SuperFan` has many `Song`s through `Review`
- A `Review` belongs to a `Song` and belongs to a `SuperFan`

- A `SuperFan` also belongs to a single favorite JT `Song`
- A `Song` has many fans who have marked it as their favorite

Start by `Drawing out your DB Diagrams` then create the models and migrations for the above database tables:

If you use a Rails generator to create the models, make sure to use the
`--no-test-framework` flag to avoid overwriting the test files.

Add any code needed in the model files to establish the relationships.

Then, run the migrations and seed file:

```sh
rails db:migrate db:seed
```

> If you aren't able to get the provided seed file working, you are welcome to
> generate your own seed data to test the application.

## Validations

Add validations to the `Review` model:

- must have a `rating` between 1 and 10
- A SuperFan can only leave a review once per song.

## Routes

Set up the following routes. Make sure to return JSON data in the format
specified along with the appropriate HTTP verb.

### GET /songs

Return JSON data in the format below:

```json
[
   {
    "id": 1,
    "name": "Cry Me A River",
    "youtube_link": "https://youtu.be/DksSPZTZES0"
  },
  {
    "id": 2,
    "name": "SexyBack",
    "youtube_link": "https://youtu.be/3gOHvDP_vCs"
  }
]
```

### GET /songs/:id

If the `Song` exists, return JSON data in the format below:

```json
{
  "id": 1,
  "name": "Rock Your Body",
  "youtube_link": "https://youtu.be/TSVHoHyErBQ",
  "reviews": [
    {
      "id": 1,
      "super_fan_id": 1, //Challenge: can you return the superfans name here instead of id
      "song_id": 1, 
      "rating": 5,
      "comment": "gibberish",
    },
    {
      "id": 1,
      "super_fan_id": 1,
      "song_id": 1,
      "rating": 5,
      "comment": "gibberish",
    },
  ]
}
```

If the `Song` does not exist, return the following JSON data, along with
the appropriate HTTP status code:

```json
{
  "error": "Song not found"
}
```

### DELETE /super_fan/:id

If the `SuperFan` exists, it should be removed from the database, along with
any `review`s that are associated with it (a `review` belongs
to a `SuperFan`, so you need to delete the `review`s before the
`SuperFan` can be deleted).

After deleting the `SuperFan`, return an _empty_ response body, along with the
appropriate HTTP status code.

If the `SuperFan` does not exist, return the following JSON data, along with
the appropriate HTTP status code:

```json
{
  "error": "SuperFan not found"
}
```

### GET /super_fans

Return JSON data in the format below: 

```json
[
  {
    "id": 1,
    "name": "Arthur",
    "years_of_fandom": "5",
    "song": {
      "id": 2,
      "name": "SexyBack",
      "youtube_link": "https://youtu.be/3gOHvDP_vCs",
    }
  },
  {
    "id": 2,
    "name": "Brendan",
    "years_of_fandom": "20",
    "song": {
      "id": 5,
      "name": "Cry Me A River",
      "youtube_link": "https://youtu.be/DksSPZTZES0",
    }
  },
]
```

### POST /reviews

This route should create a new `Review` that is associated with an
existing `Song` and `SuperFan`. It should accept an object with the following
properties in the body of the request:

```json
{
  "song_id": 5,
  "super_fan_id": 1,
  "rating": 3,
  "comment": "some comment"
}
```

If the `Review` is created successfully, send back a response with the data
related to the `Song`:

```json
{
  "id": 1,
  "name": "Cry Me A River",
  "youtube_link": "https://youtu.be/DksSPZTZES0"
}
```

If the `Review` is **not** created successfully, return the following
JSON data, along with the appropriate HTTP status code:

```json
{
  "errors": ["validation errors"]
}
```

## Custom Route

### GET /song/top_charts

Finds the song with the most reviews and returns 
JSON data in the format below:


```json
  {
    "id": 1,
    "name": "Sottocasa NYC",
    "total_reviews": 7,
    "average_rating": 3
  },
```
