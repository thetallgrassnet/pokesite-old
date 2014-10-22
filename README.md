# thetallgrass.net

[![Build Status](https://travis-ci.org/thetallgrassnet/pokesite.svg)](https://travis-ci.org/thetallgrassnet/pokesite)
[![Code Climate](https://codeclimate.com/github/thetallgrassnet/pokesite/badges/gpa.svg)](https://codeclimate.com/github/thetallgrassnet/pokesite)
[![Test Coverage](https://codeclimate.com/github/thetallgrassnet/pokesite/badges/coverage.svg)](https://codeclimate.com/github/thetallgrassnet/pokesite)
[![Dependency Status](https://gemnasium.com/thetallgrassnet/pokesite.svg)](https://gemnasium.com/thetallgrassnet/pokesite)

Your one-stop Pokémon fan community and database.

## Development

### Requirements

 * Ruby 2.1.3 (preferably installed by [RVM](http://rvm.io/))
 * PostgreSQL 9.3

### Setup

 1. Clone the project and `cd` into it:

        $ git clone https://github.com/thetallgrassnet/pokesite.git
        $ cd pokesite

 2. Bootstrap the application:

        $ bin/setup

    What this does (you don't need to run these commands): install dependencies,

        $ gem install bundler
        $ bundle install

    and set up the database:

        $ bin/rake db:setup

    then clean up logs and temp files and restart the application server if it's
    running.

 3. Start the server:

        $ bin/rails s

#### Updating

    $ git pull
    $ bin/setup

### Testing

    $ bin/rspec
