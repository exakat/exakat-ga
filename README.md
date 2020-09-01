# Github Actions for Exakat

## Usage

You can use it as a Github Action like this:

_.github/workflows/test.yml_

```
on: [push, pull_request]
name: Test
jobs:
  exakat:
    name: Exakat
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - name: Exakat
      uses: docker://exakat/exakat-ga
```

## Docker

A Docker-Image is built automatically and located here:
https://hub.docker.com/r/exakat/exakat-ga

You can run this image locally, with the following Docker command : 

`docker run --rm -it -v ${PWD}:/app exakat/exakat-ga:latest`

`$PWD` supposes the code to analyze is in the current folder. Adapt if needed.