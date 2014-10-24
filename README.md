# thetallgrass.net

[![Build Status](http://img.shields.io/travis/thetallgrassnet/pokesite.svg?style=flat)](https://travis-ci.org/thetallgrassnet/pokesite)
[![Code Climate](http://img.shields.io/codeclimate/github/thetallgrassnet/pokesite.svg?style=flat)](https://codeclimate.com/github/thetallgrassnet/pokesite)
[![Test Coverage](http://img.shields.io/codeclimate/coverage/github/thetallgrassnet/pokesite.svg?style=flat)](https://codeclimate.com/github/thetallgrassnet/pokesite)
[![Dependency Status](http://img.shields.io/gemnasium/thetallgrassnet/pokesite.svg?style=flat)](https://gemnasium.com/thetallgrassnet/pokesite)

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
