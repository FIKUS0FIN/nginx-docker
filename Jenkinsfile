pipeline {
  agent any
  stages {
    stage('Check docker ') {
      steps {
        sh '''ls -la
tree -R'''
        sh 'sudo docker info'
      }
    }
    stage('build image ') {
      steps {
        sh 'sudo docker build --tag boodman/jeke:${BUILD_NUMBER} .'
        sh 'sudo docker images | grep "jeke"'
      }
    }
    stage('run image') {
      steps {
        sh 'sudo docker run --name korobka -tid -p 80:80 boodman/jeke:${BUILD_NUMBER}'
      }
    }
    stage('clean up ') {
      steps {
        sh 'sudo netstat -tlpn | grep "80" | grep -i docker | grep "80"'
        sleep 5
        sh 'sudo docker rm -f korobka'
        sh '''#!/bin/bash

set -o pipefail
set -x

version=$((${BUILD_NUMBER}-1))
echo $version
#sudo docker rmi boodman/jeke:$version | true

sudo docker rmi -f $(sudo docker images boodman/jeke -q | tail -n +2) || ture '''
      }
    }
  }
  environment {
    Docker = 'yes'
    Custom = 'nginx '
  }
}