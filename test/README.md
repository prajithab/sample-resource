<!-- BEGIN_TF_DOCS -->

## Overview
A terratest test that creates a cloudsql mysl DB cluster, verifies that the instance_connection_name contains a string as defined in the 
../examples/terratest.tfvars file (as well as does not contain a random string).
The cluster is destroyed after the test.

## Requirements

Set the GOOGLE_APPLICATION_CREDENTIALS environment variable in your shell before executing terratest.
Set-up terratest following these instructions:

Download go: https://golang.org/
export GOOGLE_APPLICATION_CREDENTIALS=$HOME/bin/digital-dfp-dev.json 

## Usage
This terratest module executes a simple test using the generic module with the tfvars file ../examples/terratest.tfvars
#### Note: 
the mandatory variable 'name' may need to be updated if you re-run this test multiple times, as this instance name will persist in the GCP environment for one week, and re-creation will be denied (even if it was successfully destroyed).
Simply update the file with a new value.

### Instructions for usage

cd to this directory
```
cd test
''''
configure dependencies:
```
go mod init test
go mod tidy
''''

### Run test
```
go test timeout=30m
'''


<!-- END_TF_DOCS -->


