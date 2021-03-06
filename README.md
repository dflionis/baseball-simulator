![Alt text](/app/assets/images/baseball_simulator.png?raw=true)

[![Build Status](https://travis-ci.org/dflionis/baseball-simulator.svg?branch=master)](https://travis-ci.org/dflionis/baseball-simulator)

Inspired by the Strat-O-Matic Baseball board game, Culture Brain's NES cult classic Baseball Simulator 1.000 and Baseball Mogul for the PC, Baseball Simulator is an attempt to create a Ruby on Rails app that drives various baseball simulation functionality:

* Full Season Simulation
* Individual Box Scores
* Scorebook Imaging
* Integration with the Strat-O-Matic board game

This is a long term project (think Perl 6) that aims to implement the aforementioned functionality a little at a time.

![Alt text](/app/assets/images/sample_boxscore.png?raw=true)

## Environment Setup

### Requirements
* PostgreSQL

### Development Database Setup
```bash
bundle exec rake db:reset
```

### Test Database Setup
```bash
bundle exec rake db:test:prepare
```
