Monitoring Vivaldi Client [![Build Status](https://drone.io/github.com/callicles/VivaldiMonitoring/status.png)](https://drone.io/github.com/callicles/VivaldiMonitoring/latest)
=========================

In this repository you will find two things :

1. A Python program 'contentgen.py' which can be used to generate dummy data on a server to test the client
2. The Dart client for the API Spark Server.

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

With that type of architecture, you can get an overview of what's happening in your distributed system without having to put a big infrastructure in place.

Moreover, Dart can be compiled into Javascript so that the app can be executed in a simple browser ! It's a way of making the app really dynamic and device friendly.

Tests
-----

Tests are not implemented yet.