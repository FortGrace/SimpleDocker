#!/bin/bash
service nginx start
gcc server.c -lpthread -lfcgi -o server
spawn-fcgi -p 8080 -n server
nginx -s reload

/bin/bash
