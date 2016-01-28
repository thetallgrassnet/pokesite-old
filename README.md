# thetallgrass.net

[![Build Status](http://img.shields.io/travis/thetallgrassnet/pokesite.svg?style=flat)](https://travis-ci.org/thetallgrassnet/pokesite)
[![Dependency Status](http://img.shields.io/gemnasium/thetallgrassnet/pokesite.svg?style=flat)](https://gemnasium.com/thetallgrassnet/pokesite)
[![Code Climate](http://img.shields.io/codeclimate/github/thetallgrassnet/pokesite.svg?style=flat)](https://codeclimate.com/github/thetallgrassnet/pokesite)
[![Test Coverage](http://img.shields.io/codeclimate/coverage/github/thetallgrassnet/pokesite.svg?style=flat)](https://codeclimate.com/github/thetallgrassnet/pokesite)
[![Issues](https://img.shields.io/github/issues/thetallgrassnet/pokesite.svg?style=flat)](https://github.com/thetallgrassnet/pokesite/issues)
[![Gitter](https://img.shields.io/badge/gitter-join%20chat-brightgreen.svg?style=flat)](https://gitter.im/thetallgrassnet/pokesite?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

Your one-stop Pokémon fan community and database.

## Development

### Requirements

 * [Docker](https://www.docker.com/)
 * [Docker Compose](https://docs.docker.com/compose/)

On OS X:

 * [DLite](https://github.com/nlf/dlite)
 * Installing Docker and Docker Compose through [Homebrew](http://brew.sh/) is
   recommended.

### Setup

```bash
$ git clone https://github.com/thetallgrassnet/pokesite.git
$ cd pokesite
$ bin/setup
$ docker-compose up
```

The servers will be listening on the following ports:

 * Web server: 48460
 * Development Neo4j server: 48461
 * Testing Neo4j server: 48462

#### Attaching to Guard

`Ctrl+Z` to suspend `docker-compose up` but leave the containers running in the
background, or open a new terminal.

```bash
$ docker attach pokesite_web_1
```

`Ctrl+P Ctrl+Q` to detach from Guard, then `fg` to return to `docker-compose up`
if you suspended it with `Ctrl+Z`.

#### Updating

```bash
$ docker-compose stop
$ git pull
$ docker-compose run --rm web bundle
```

### Testing

```bash
$ docker-compose run --rm web bin/rspec
```

### Running commands

```bash
$ docker-compose run --rm web COMMAND [ARGUMENTS]
```

For example, to start a Rails console:

```bash
$ docker-compose run --rm web bin/rails c
```

### Shutdown

`Ctrl+C` from `docker-compose up`, and to be sure everything is down:

```bash
$ docker-compose stop
```
