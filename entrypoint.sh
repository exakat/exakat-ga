#!/bin/sh

cd /usr/src/exakat

export EXAKAT_IGNORE_RULES=$INPUT_IGNORE_RULES
export EXAKAT_IGNORE_DIRS=$INPUT_IGNORE_DIRS
export EXAKAT_INCLUDE_DIRS=$INPUT_INCLUDE_DIRS

ln -s /github/workspace projects/review/code
exakat project -p review