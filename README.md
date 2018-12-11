[![Docker Pulls](https://img.shields.io/docker/pulls/zaherg/php-7.2-xdebug-alpine.svg)](https://hub.docker.com/r/zaherg/php-7.2-xdebug-alpine/) [![](https://images.microbadger.com/badges/image/zaherg/php-7.2-xdebug-alpine.svg)](https://microbadger.com/images/zaherg/php-7.2-xdebug-alpine "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/zaherg/php-7.2-xdebug-alpine.svg)](https://microbadger.com/images/zaherg/php-7.2-xdebug-alpine "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/commit/zaherg/php-7.2-xdebug-alpine.svg)](https://microbadger.com/images/zaherg/php-7.2-xdebug-alpine "Get your own commit badge on microbadger.com")  [![](https://img.shields.io/github/last-commit/linuxjuggler/php-7.2-xdebug-alpine.svg)](https://github.com/linuxjuggler/php-7.2-xdebug-alpine)


## Image description

This image contain php-7.2 based on alpine with xDebug, MySQL, PostgreSQL, Redis & GD enabled and Composer already installed

```
PHP 7.2.12 (fpm-fcgi) (built: Nov 16 2018 04:05:42)
Copyright (c) 1997-2018 The PHP Group
Zend Engine v3.2.0, Copyright (c) 1998-2018 Zend Technologies
    with Xdebug v2.6.1, Copyright (c) 2002-2018, by Derick Rethans
```

## Runing the image:

By default xdebug is enabled, to disable it you need to create a `.env` file which should contain the following variables, but remember to change the value based one what you want to achieve:

```
PHP_XDEBUG_DEFAULT_ENABLE=0
PHP_XDEBUG_REMOTE_ENABLE=0
PHP_XDEBUG_REMOTE_HOST=127.0.0.1
PHP_XDEBUG_REMOTE_PORT=9001
PHP_XDEBUG_REMOTE_AUTO_START=0
PHP_XDEBUG_REMOTE_CONNECT_BACK=0
PHP_XDEBUG_IDEKEY=docker
PHP_XDEBUG_PROFILER_ENABLE=0
PHP_XDEBUG_PROFILER_OUTPUT_DIR=/tmp
```

Then run the docker and specify the env file that you have created like this

```
docker run --env-file .env -p 80:80 zaherg/php-7.2-xdebug-alpine
```

## Installed modules information

It has the following modules:

[PHP Modules]

1. Core 
1. ctype  
1. curl 
1. date 
1. dom  
1. fileinfo 
1. filter 
1. ftp  
1. gd 
1. hash 
1. iconv  
1. intl 
1. json 
1. libxml 
1. mbstring 
1. mysqlnd  
1. openssl   
1. pcre 
1. PDO  
1. pdo_mysql  
1. pdo_pgsql  
1. pdo_sqlite 
1. pgsql 
1. Phar 
1. posix  
1. readline 
1. redis  
1. Reflection 
1. session  
1. SimpleXML  
1. sodium
1. SPL
1. sqlite3  
1. standard 
1. tokenizer  
1. xdebug 
1. xml  
1. xmlreader  
1. xmlwriter  
1. zip  
1. zlib 

[Zend Modules]

1. Xdebug

## GD information

```
GD Support => enabled
GD Version => bundled (2.1.0 compatible)
FreeType Support => enabled
FreeType Linkage => with freetype
FreeType Version => 2.8.1
GIF Read Support => enabled
GIF Create Support => enabled
JPEG Support => enabled
libJPEG Version => 8
PNG Support => enabled
libPNG Version => 1.6.34
WBMP Support => enabled
XBM Support => enabled

Directive => Local Value => Master Value
gd.jpeg_ignore_warning => 1 => 1
```
