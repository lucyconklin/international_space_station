# International Space Station Tracker

#### _There are people in space. Right. Now._

The International Space Station Tracker is a tool for spotting the International Space Station. There are people in space doing research and pushing the boundaries of human achievement, and you can see them, but you just have to know when and where to look.

This project is live on [Heroku](https://international-space-station.herokuapp.com/).
___
## Getting Started
This project was built in Rails with a JavaScript front end.

### Setup
fork and clone

```
rails db:{create,migrate}
rails db:test:prepare
```

### Testing
If that is all working, you should be able to run:
```
rspec
```
and see passing or skipped tests.

## Internal API
Make sure to test the internal API by starting the server:
```
rails s
```
And visiting the following endpoints in your browser (or via [Postman](https://chrome.google.com/webstore/detail/postman/fhbjgbiflinjbdggehcddcbncdddomop?hl=en))

### Current Location

For the current longitude and latitude of the ISS:

`GET localhost:3000/api/v1/iss-position`

This should return JSON like this:
```
{
iss_position: {
latitude: "-24.9167",
longitude: "-137.4663"
},
timestamp: 1490630031,
message: "success"
}
```

### People In Space

For the names of people currently in space:

`GET localhost:3000/api/v1/astronauts`

This should return JSON like this:
```
{
people: [
{
craft: "ISS",
name: "Sergey Rizhikov"
},
{
craft: "ISS",
name: "Andrey Borisenko"
},
{
craft: "ISS",
name: "Shane Kimbrough"
},
{
craft: "ISS",
name: "Oleg Novitskiy"
},
{
craft: "ISS",
name: "Thomas Pesquet"
},
{
craft: "ISS",
name: "Peggy Whitson"
}
],
message: "success",
number: 6
}
```

### Next Pass Time

This endpoint requires a zipcode to be passed in the url. Here is an example request:

`GET localhost:3000/api/v1/pass-time?zipcode=80120`

This will return JSON that looks like this:
```
{
format_date: "Monday, 27 Mar 2017 7:30 PM"
}
```
