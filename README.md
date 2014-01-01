Monitoring Vivaldi Client [![Build Status](https://drone.io/github.com/callicles/VivaldiMonitoring/status.png)](https://drone.io/github.com/callicles/VivaldiMonitoring/latest)
=========================

In this repository you will find two things :

1. A Python program 'contentgen.py' which can be used to generate dummy data on a server to test the client
2. The Dart client for the API Spark Server.

#### Important Note
You will not find the configuration file 'settings.yaml' in this repository you will have to create it by yourself.

It should be something like :

settings.yaml
```yaml
rootUrl: <yourApiUrl>
login: <yourApiLogin>
password: <yourApiPassword>
```

You may now want to know a little bit more about the monitoring application architecture.

Architecture
------------
    
    --------
    |      |
    |  V   |----\
    |server|     \
    |      |      \               |---------| 2. JSON       |---------|
    --------       \              |   API   | ------------> |   DART  |
                    |-----------> |  SPARK  |               |   APP   |
    --------       / Coordinates  |         | <------------ |         |
    |      |      /               |---------|  1. Request   |---------|
    |  V   |     /                                 data
    |server|----/                REST API that                Client
    |      |                    aggregates data
    --------                 from the distributed
                                    servers
    Vivaldi
    Servers
    (contentgen.py simulates these servers for development purpuses)

With that type of architecture, you can get an overview of what's happening in your distributed system without having to put a big infrastructure in place.

Moreover, Dart can be compiled into Javascript so that the app can be executed in a simple browser ! It's a way of making the app really dynamic and device friendly.

### API Spark
Here is how are made the objects in [API SPARK]{http://apispark.com}

* Network
    - _id
    - name
* Node
    - _id
    - path
    - network
* InitTime
    - _id
    - timestamp
    - node
* Coordinate
    - _id
    - timestamp
    - x
    - y
    - node

### Dart App
Will come soon

Tests
-----

Tests are not implemented yet.