# Github Action for Exakat

Scan with the Exakat GitHub Action your PHP code to detect tricky issues, prevent vulnerabilities and control the quality.

Exakat is a customizable static analyzer engine for all PHP 5.2 to PHP 8.2-dev Applications for better Quality, Security, Performance and Documentation

## Usage
The Exakat Github Action has to be declared in your workflow like this:

_.github/workflows/compatibility.php80.yml

```yaml
on: [push, pull_request]
name: Test
jobs:
  exakat:
    name: Compabitibility PHP 8.0 with Exakat
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - name: Exakat
      uses: docker://exakat/exakat-ga-compatibility-php-80
```

The `on` event that triggers the workflow can be adapted following the GitHub Action Documentation.

By default an analysis is processed on all rules of the ruleset "CI-checks". The detail of the ruleset is to found in the documentation at: 
https://exakat.readthedocs.io/en/latest/Rulesets.html#ci-checks

The Exakat Github Action scans all php files and detects automatically all common libraries and frameworks.

## A PHP Gate in the Workflow
The Exakat GitHub Action raises a failure in the Workflow at the first issue detected. 

The Exakat GitHub Action exposes all the results in Perfile style.
See more at : https://exakat.readthedocs.io/en/latest/Reports.html#perfile


```
-----------------------------------------------------------------------------------------------------------------------------------
 line  /bin/sculpin.php
-----------------------------------------------------------------------------------------------------------------------------------
   17 @ Operator                               Structures/Noscream                     
   19 Missing Returntype In Method             Typehints/MissingReturntype             
   20 Avoid Substr() One                       Structures/NoSubstrOne                  
   21 Useless Casting                          Structures/UselessCasting               
   22 Switch Without Default                   Structures/SwitchWithoutDefault         
   33 Wrong Returned Type                      Functions/WrongReturnedType             
   36 Uses Default Values                      Functions/UsesDefaultArguments          
   39 @ Operator                               Structures/Noscream                     
   44 Hidden Use Expression                    Namespaces/HiddenUse                    
   45 Hidden Use Expression                    Namespaces/HiddenUse                    
   46 Hidden Use Expression                    Namespaces/HiddenUse                    
   51 Uses Default Values                      Functions/UsesDefaultArguments          
   53 Uses Default Values                      Functions/UsesDefaultArguments 
```
Be aware that all our rules are fully documentated with code examples to apply remadiation.

We recommend you configure your important analysis for a better PHP Code control.

## Run Locally Docker 
A Docker-Image is built automatically and located here:
https://hub.docker.com/r/exakat/exakat-ga

You can run this image locally, with the following Docker command : 

`docker run --rm -it -v ${PWD}:/github/workspace exakat/exakat-ga:latest`

`$PWD` supposes the code to analyze is in the current folder. Adapt if needed.

## Exakat GitHub Action & PHP Version
Exakat GitHub Action on Free Usage runs PHP7.4. Contact-us for more PHP version.

## Need more information ?
Drop us a note on [Exakat HelpDesk](https://exakat.zendesk.com/hc/en-us/requests/new) and let’s make code better together.
P