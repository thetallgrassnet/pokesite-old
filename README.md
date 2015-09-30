# thetallgrass.net

[![Build Status](http://img.shields.io/travis/thetallgrassnet/pokesite.svg?style=flat)](https://travis-ci.org/thetallgrassnet/pokesite)
[![Dependency Status](http://img.shields.io/gemnasium/thetallgrassnet/pokesite.svg?style=flat)](https://gemnasium.com/thetallgrassnet/pokesite)
[![Code Climate](http://img.shields.io/codeclimate/github/thetallgrassnet/pokesite.svg?style=flat)](https://codeclimate.com/github/thetallgrassnet/pokesite)
[![Test Coverage](http://img.shields.io/codeclimate/coverage/github/thetallgrassnet/pokesite.svg?style=flat)](https://codeclimate.com/github/thetallgrassnet/pokesite)
[![Huboard](https://img.shields.io/github/issues/thetallgrassnet/pokesite.svg?style=flat)](https://huboard.com/thetallgrassnet/pokesite/)
[![Gitter](https://img.shields.io/badge/gitter-join%20chat-brightgreen.svg?style=flat)](https://gitter.im/thetallgrassnet/pokesite?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

Your one-stop Pokémon fan community and database.

## Development

### Requirements

  * [Docker Toolbox](https://www.docker.com/toolbox)
  * A running Docker machine:

    ```bash
    $ docker-machine create --driver=virtualbox default
    $ docker-machine start default
    $ eval "$(docker-machine env default)"
    $ docker-machine ip default
    ```

### Setup

```bash
$ git clone https://github.com/thetallgrassnet/pokesite.git
$ cd pokesite
$ bin/setup
$ docker-compose up
```

If the output of `docker-machine ip` was `192.168.99.100`, the servers will
be listening on the following ports:

 * Web server: http://192.168.99.100:48460
 * Development Neo4j server: http://192.168.99.100:48461
 * Testing Neo4j server: http://192.168.99.100:48462

#### Updating

```bash
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

```bash
$ docker-compose stop
```
