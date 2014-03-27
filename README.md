# jprjr/php-fpm

This is an Arch Linux-based image with PHP-FPM installed.

It's pre-configured to listen on port 9000.

## Usage

This is really meant to be used for building new docker images with
your PHP app. I'll write up a blog post on what I like to do.

It uses php-fpm as the entrypoint.

### Build

```
$ docker build -t <repo name>.
```

### Run in foreground

```
$ docker run -p 9000 jprjr/php-fpm
```

### Run in background
```
$ docker run -d -p 9000 jprjr/php-fpm
```

## Exposed ports

* 9000
