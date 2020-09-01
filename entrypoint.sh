#!/bin/sh

cd /usr/src/exakat
ln -s /github/workspace projects/review/code
exakat project -p review