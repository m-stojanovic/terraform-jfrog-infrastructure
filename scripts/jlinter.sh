#!/bin/bash
# Linting via HTTP POST using curl
JENKINS_URL='https://devops-jenkins.devops.co.uk/'
curl -X POST --user 'user:password' -F "jenkinsfile=<$1" $JENKINS_URL/pipeline-model-converter/validate
