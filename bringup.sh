#!/bin/bash

set -u # Variables must be explicit
set -e # If any command fails, fail the whole thing
set -o pipefail

# Make sure SSH knows to use the correct pem
ssh-add ~/.ssh/myaws.pem
ssh-add -l
# Load the AWS keys
. /etc/ansible/aws.key
