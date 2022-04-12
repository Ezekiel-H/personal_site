---
title: "FIRN presentation"
author: "Ezekiel Haggart"
date: '2022-04-11'
slug: FIRN
---
  
## Overview
This presentation takes two datasets provided and leveraging both snowflake and DBT demonstrates the benefits of pivoting to a modern platform.
Additionally I have introduced a presentation layer using both Gitab and R to further touch on the flexiblity of using a rapid development. 

The presentation is outlines in the following way

- Approach:
- Data
- Results
- A/B Testing
- Dicussion points

  
## Approach
### DBT
Not wanting to reinvent the wheel I followed the standard user guide [here](https://discourse.getdbt.com/t/setting-up-snowflake-the-exact-grant-statements-we-run/439) focusing on ensuring a reproducible pattern was established.

### Database structure
I decided on a two step approach for the database structure where the initial data was inserted in its entirety into the `RAW/BIKES` layer then I constructed a "Raw Data Store" `RAW/RDS` that was to be used as the source layer. 

This was to provide clear and definable separation between working in the snowflake UI and within a development environment in DBT. It also has a number of associated benefits:

- Assuming you wanted to automate the ingestion it would protect downstream dependencies  
- json handling
- DBT mapping
- Developer friendly documentation



```
RAW
----/BIKES
---------/CITI_BIKES  
---------/WEATHER
----/RDS
--------/RDS_BIKES
--------/RDS_BIKES_SAMPLE
--------/RDS_WEATHER
--------/RDS_WEATHER_SAMPLE

ANALYTICS
---------/ADS
-------------/BIKES_METRICS
-------------/RIDER_WEATHER
-------------/WEATHER_METRICS
```



### Snowflake

### Gitlab 
As it is a single developer working on the project I set up a simple structure of allowing for direct code commits and pushes against main from any feature branch.

Environmentally there is no consideration to promotion of code through environments but structurally the separation could be introduced by extending the native dbt_user protections and moving the jobs onto protected branches.


  
## Data
The raw data was located in two sets under the database raw:

bikes: `https://s3.amazonaws.com/tripdata/index.html`

weather: `s3://snowflake-workshop-lab/weather-nyc`

#### Bikes 
Taking a sample in R to prepare the load we were left with the following structure
```
create or replace table citi
(tripduration integer,
  starttime timestamp,
  stoptime timestamp,
  start_station_id integer,
  start_station_name string,
  start_station_latitude float,
  start_station_longitude float,
  end_station_id integer,
  end_station_name string,
  end_station_latitude float,
  end_station_longitude float,
  bikeid integer,
  membership_type string,
  usertype string,
  birth_year integer,
  gender integer);

```

Looking a little closer (after some googling) I found there was a path declared online for the s3 bucket in the following format.AsIs(

```
URL s3://snowflake-workshop-lab/citibike-trips
```

This allowed me to input all 61 million rows... which may have been excessive for the excercise but I digress. 

#### Weather

The weather dataset followed the exact same pattern apart from leveraging a standard JSON pattern. Which snowflake lets us deal with really cleanly

```
{
  "city": {
    "coord": {
      "lat": 43.000351,
      "lon": -75.499901
    },
    "country": "US",
    "findname": "NEW YORK",
    "id": 5128638,
    "langs": [
      {
        "abbr": "NY"
      },
      {
...
      },
      {
        "zh": "纽约州"
      }
    ],
    "name": "New York",
    "zoom": 1
  },
  "clouds": {
    "all": 90
  },
  "main": {
    "humidity": 81,
    "pressure": 1016,
    "temp": 285.53,
    "temp_max": 286.15,
    "temp_min": 285.15
  },
  "time": 1478206834,
  "weather": [
    {
      "description": "overcast clouds",
      "icon": "04d",
      "id": 804,
      "main": "Clouds"
    }
  ],
  "wind": {
    "deg": 280,
    "speed": 6.2
  }
}
```

All I actually want from here is weather so lets get temp, wind speed, and the weather

## Results
· Number of Trips
· Average Duration
· Distance Travelled (hint - haversine function)

## A/B testing

Trying to understand if weather has an impact on ridership we need to combine the datasets and run an analysis overtop of it. 
The approach I have decided to go for is using R to run a linear regression and checking for significance. 


## Discussion

