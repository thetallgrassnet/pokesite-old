# thetallgrass.net

[![Build Status](https://travis-ci.org/thetallgrassnet/pokesite.svg)](https://travis-ci.org/thetallgrassnet/pokesite)
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

 2. Install gem dependencies:

        $ bundle install

 3. Set up the database:

        $ bin/rake db:setup

 4. Start the server:

        $ bin/rails s

### Testing

    $ bin/rspec
