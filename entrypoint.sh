#!/bin/sh

cd /usr/src/exakat

export EXAKAT_IGNORE_RULES=$INPUT_IGNORE_RULES
export EXAKAT_IGNORE_DIRS=$INPUT_IGNORE_DIRS
export EXAKAT_INCLUDE_DIRS=$INPUT_INCLUDE_DIRS
export EXAKAT_FILE_EXTENSIONS=$INPUT_FILE_EXTENSIONS
export EXAKAT_PROJECT_REPORTS=$INPUT_PROJECT_REPORTS

ln -s /github/workspace projects/review/code

exakat project -p review -v "$@"

# check 

if [ ! -z "$INPUT_EXIT_ON_ISSUES" ] 
then
    # get the results from Text format, to count them
    exakat report -p review --format Text > exit.txt
    if [ -s exit.txt ] 
    then
        exit 1
    else
        exit 0
    fi
fi